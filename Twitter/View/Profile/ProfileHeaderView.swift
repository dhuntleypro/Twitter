//
//  ProfileHeaderView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    //let user : User // instant in iside of profile view model now (can delete)
    @State var  selectedFilter: TweetFilterOptions = .tweets
    
    @ObservedObject var viewModel : ProfileViewModel
   // let user : User
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.user.profileImageURL))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120/2)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
            
            
            Text(viewModel.user.fullname)
                .font(.system(size: 14 , weight: .semibold))
                .padding(.top, 8)
            
            Text("@ \(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Billionaire by day, dark knight by night")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                
                VStack {
                    Text("\(viewModel.user.stats.followers)")
                        .font(.system(size: 16 , weight: .bold))
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("\(viewModel.user.stats.following)")
                        .font(.system(size: 16 , weight: .bold))
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                }
            }
            .padding()
            
            ProfileActionButtonView(viewModel: viewModel)
            
            
            
            Spacer()
            
        }
    }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView(user: User(dictionary: "hh"))
//    }
//}
