//
//  ChatViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/30/21.
//

import SwiftUI
import Firebase

struct ChatViewModel {
    let user : User
    
    init(user: User) {
        self.user = user
    }
    func fetchMessages() {
        
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
