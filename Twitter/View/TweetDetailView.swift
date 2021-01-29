//
//  TweetDetailView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/29/21.
//

import SwiftUI
import Kingfisher

struct TweetDetailView: View {
    let tweet : Tweet
    
    var body: some View {
        VStack(alignment: .leading , spacing: 16) {
            HStack {
                KFImage(URL(string: tweet.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(26)
                
                VStack(alignment: .leading , spacing: 16) {
                    Text(tweet.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(tweet.username)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            
            Text(tweet.caption)
                .font(.system(size: 22))
            
            Text("7:22 PM • 01/29/2021")
                .font(.system(size: 14))
                .foregroundColor(.gray)

            Divider()
            
            HStack(spacing: 12) {
                HStack {
                    Text("0")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Retweets")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("0")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            
            Divider()
            
            TweetActionsView()
            Spacer()
        }
        .padding()
    }
}

//struct TweetDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetDetailView(tweet: Tweet()
//    }
//}
