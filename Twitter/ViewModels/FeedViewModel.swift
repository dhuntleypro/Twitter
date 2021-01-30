//
//  FeedViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/29/21.
//

import SwiftUI

class FeedViewModel : ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    // list of all tweets
    func fetchTweets() {
        COLLECTION_TWEETS
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.tweets = documents.map({ Tweet(dictionary: $0.data())})
            }
    }
}
