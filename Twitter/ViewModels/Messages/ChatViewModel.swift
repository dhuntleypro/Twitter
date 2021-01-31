//
//  ChatViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/30/21.
//

import SwiftUI
import Firebase

class ChatViewModel : ObservableObject {
    let user : User
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
        
        // observes any changes in firbase data
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else { return }
                
                COLLECTION_USERS.document(fromId).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                    self.messages.sort(by: { $0.timestamp.dateValue() < $1.timestamp.dateValue() })
                }
            }
        }
    }
    
    func sendMessage(_ messageText: String) {
        // get current user
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        // upload message for current user
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let recivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")

        let messageID = currentUserRef.documentID
        
        let data: [String: Any] = [ "text" : messageText,
                                    "id" : messageID,
                                    "fromId" : currentUid,
                                    "toId" : user.id,
                                    "timestamp" : Timestamp(date: Date())
        ]
        // update / upload
        currentUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        recivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id).setData(data)
        
    }
    
}
