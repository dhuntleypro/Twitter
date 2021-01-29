//
//  Tweet.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/29/21.
//

import SwiftUI
import Firebase

struct Tweet: Identifiable {
    let id: String // for each tweet
    let username: String
    let profileImageURL: String
    let fullname: String
    let caption: String
    let likes : Int
    let uid : String // for each user
    let timestamp: Timestamp
    
    init(dictionary : [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())

    }
}
