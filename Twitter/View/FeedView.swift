//
//  FeedView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) { // floating bottom button (New tweet)
            ScrollView {
                
                //LazyVStack { // Only load cells as they become visable on screen
                VStack {
                    ForEach(0..<24) { _ in
                        TweetCell()
                        
                    }
                }
                .padding()
            }
            
            
            Button(action: {}, label: {
                Image("Tweet")
                    .resizable()
                    .renderingMode(.template) // Allow editting to image color
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white) // Change Image color
            .clipShape(Circle())
            .padding()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
