//
//  SearchViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/21/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUser()
    }
    
    
    func fetchUser() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            // READ INTO EACH DOCMENT
            self.users = documents.map({ User(dictionary: $0.data()) })
            
            
        }
    }
}
