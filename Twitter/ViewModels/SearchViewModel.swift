//
//  SearchViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/21/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    // MODEL
    @Published var users = [User]()
    
    init() {
        fetchUser()
    }
    
    
    func fetchUser() {
//        Firestore.firestore()
//            .collection("users")
        COLLECTION_USERS
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            // CREATE A USER FOR EACH DOCUMENT 
            self.users = documents.map({ User(dictionary: $0.data()) })
            
            
        }
    }
}
