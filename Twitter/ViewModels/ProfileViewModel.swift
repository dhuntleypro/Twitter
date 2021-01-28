//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    let user: User
    @Published var isFollowed = false
    
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    // setting document data
    func follow() {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
        // store inside property
        let followingRef = COLLECTION_FOLLOWING
            .document(currenUid)
            .collection("user-following")
        
        let followersRef = COLLECTION_FOLLOWERS
            .document(user.id)
            .collection("user-followers")
        
        
        followingRef.document(user.id).setData([:]) { _ in
            followersRef.document(currenUid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    // delete document data
    func unfollow() {
        //get current user
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
        
        
        let followingRef = COLLECTION_FOLLOWING
            .document(currenUid)
            .collection("user-following")
        
        let followersRef = COLLECTION_FOLLOWERS
            .document(user.id)
            .collection("user-followers")
        
        followingRef.document(user.id).delete() { _ in
            followersRef.document(currenUid).delete() { _ in
                self.isFollowed = false
            }
        }
    }
    
    
    //
    func checkIfUserIsFollowed() {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }

        let followingRef = COLLECTION_FOLLOWING
            .document(currenUid)
            .collection("user-following")
        
        followingRef.document(user.id).getDocument { snapshot , _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
    }
}
