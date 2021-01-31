//
//  SearchViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/21/21.
//

import SwiftUI
import Firebase

enum SearchViewModelConfiguration {
    case search
    case newMessage
}


class SearchViewModel: ObservableObject {
    // MODEL
    @Published var users = [User]()
    private var config: SearchViewModelConfiguration
    
    init(config: SearchViewModelConfiguration) {
        self.config = config
        fetchUser(forConfig: config)
        
    }
    
    
    func fetchUser(forConfig config : SearchViewModelConfiguration) {
//        Firestore.firestore()
//            .collection("users")
        COLLECTION_USERS
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let users = documents.map({ User(dictionary: $0.data()) })
                
                switch config {
                case .newMessage :
                    self.users = users.filter({ !$0.isCurrentUser})
                case .search :
                    // CREATE A USER FOR EACH DOCUMENT
                    self.users = users
                }
                
           
            
            
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) })
    }
}
