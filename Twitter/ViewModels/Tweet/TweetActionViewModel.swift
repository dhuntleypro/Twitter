//
//  TweetActionViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/29/21.
//

import SwiftUI

class TweetActionViewModel: ObservableObject {
    let tweet : Tweet
    
    @Published var didLike = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    
    func likeTweet() {
        // get user
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // set tweet-likes
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        // set user-likes
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        
        // Add likes
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes" : tweet.likes + 1]) { _ in
            tweetLikesRef.document(uid).setData([:]) { _ in
                userLikesRef.document(self.tweet.id).setData([:]) { _ in
                    self.didLike = true
                }
            }
        }
    }
    
    func unlikeTweet() {
        // get user
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // set tweet-likes
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        // set user-likes
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        // delete likes
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes" : tweet.likes - 1]) { _ in
            tweetLikesRef.document(uid).delete { _ in
                userLikesRef.document(self.tweet.id).delete { _ in
                    self.didLike = false
                }
            }
        }
        
    }
    
    func checkIfUserLikedTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id)
        
        userLikesRef.getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
    }
}
