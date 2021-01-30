//
//  UserProfileView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

struct UserProfileView: View {
    @State var  selectedFilter: TweetFilterOptions = .tweets
    
    let user : User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.tweet(forFilter: selectedFilter)) { tweet in
                    TweetCell(tweet: tweet)
                        .padding(.horizontal, 30)
                }

            }
        }
        .navigationTitle(user.username)
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
