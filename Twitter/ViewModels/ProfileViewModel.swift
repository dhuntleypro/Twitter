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
    //published gets displayed
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()

    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserTweets()
        fetchLikedTweets()
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
    
    
    // check
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
    
    // fetch
    func fetchUserTweets() {
        // filter
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            // array of documents
            guard let documents = snapshot?.documents else { return }
            // loop throught each document in array
            self.userTweets = documents.map({ Tweet(dictionary: $0.data()) })

            print("DEBUG: User Tweets \(self.userTweets)")

        }
    }
    
    func fetchLikedTweets() {
        // array of tweets
        var tweets = [Tweet]()
        // filter
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
        
            let tweetIDs  = documents.map({ $0.documentID})
            tweetIDs.forEach { id in
                COLLECTION_TWEETS.document(id).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    
                    let tweet = Tweet(dictionary: data)
                    tweets.append(tweet)
                    guard tweets.count == tweetIDs.count else { return }
                    self.likedTweets = tweets
                  //  print("DEBUG: Liked tweet is \(tweet)")
                    
                }
            }
        }
    }
    
    func tweet(forFilter filter: TweetFilterOptions) -> [Tweet] {
        switch filter {
        case .tweets: return userTweets
        case .likes: return likedTweets
        }
        
    }
}
