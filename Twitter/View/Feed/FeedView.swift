//
//  FeedView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) { // floating bottom button (New tweet)
            ScrollView {
                
                LazyVStack { // Only load cells as they become visable on screen
                    ForEach(viewModel.tweets) { tweet in
                        NavigationLink(destination: TweetDetailView(tweet: tweet)) {
                            TweetCell(tweet: tweet)
                        }
                    }
                }
                .padding()
            }
            
            
            Button(action: {
                self.isShowingNewTweetView.toggle()
            }, label: {
                Image("Tweet")
                    .resizable()
                    .renderingMode(.template) // Allow editting to image color
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white) // Change Image color with the help of .renderingMode(.template)
            .clipShape(Circle())
            .padding()
            // (tip) Full screen sheet
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetsView(isPresented: $isShowingNewTweetView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
