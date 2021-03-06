//
//  UploadTweetViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/28/21.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented : Bool
    
    // Dismiss view via Binding
    init(isPresented : Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    
    func uploadTweet(caption: String) {

        // current iser
        guard let user = AuthViewModel.shared.user else { return }
        
        // create random ID
        let docRef = COLLECTION_TWEETS.document()
        
        // data dictionary
        let data: [String: Any] = [ "uid" : user.id,
                                    "caption" : caption,
                                    "fullname" : user.fullname,
                                    "timestamp" : Timestamp(date: Date()),
                                    "username" : user.username,
                                    "profileImageURL" : user.profileImageURL,
                                    "likes" : 0,
                                    "id" : docRef.documentID
                                ]
        // upload it to our tweet collection
        docRef.setData(data) { _ in
            print("DEBUG: Uploaded tweet... ")
            // Dismiss Screen
            self.isPresented = false
        }
        
        
        
    }
    
    
    
    
/// Alternitive way to dismiss view but via Completion
    
//    func uploadTweet(caption: String, completion: @escaping ((Error?) -> Void)) {
//        guard let user = AuthViewModel.shared.user else { return }
//
//        // create random ID
//        let docRef = COLLECTION_TWEETS.document()
//
//        // data dictionary
//        let data: [String: Any] = [ "uid" : user.id,
//                                    "caption" : caption,
//                                    "fullname" : user.fullname,
//                                    "timestamp" : Timestamp(date: Date()),
//                                    "username" : user.username,
//                                    "profileImageURL" : user.profileImageURL,
//                                    "likes" : 0,
//                                    "id" : docRef.documentID
//                                ]
//        // upload it to our tween section in firebase
//        docRef.setData(data, completion: completion)
//
//    }
}

