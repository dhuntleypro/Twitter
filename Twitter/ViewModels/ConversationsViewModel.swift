//
//  COversationVIewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/30/21.
//

import SwiftUI
      
class ConversationsViewModel: ObservableObject {

    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        query.order(by: "timestamp", descending: true)
        
        // observes any changes in firbase data
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges else { return }
            
            changes.forEach { change in
                let messageData = change.document.data()
                let uid = change.document.documentID
                
                COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    
                    self.recentMessages.append(Message(user: user, dictionary: messageData))
                }
            }
        }
    }
}

