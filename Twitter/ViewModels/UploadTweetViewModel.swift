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
    
    init(isPresented : Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    
    func uploadTweet(caption: String) {
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
        // upload it to our tween section in firebase
        docRef.setData(data) { _ in
            print("DEBUG: Uploaded tweet... ")
            self.isPresented = false
        }
        
        
        
    }
}

