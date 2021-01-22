//
//  UserCell.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI

import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            HStack(spacing: 12){
                KFImage(URL(string: user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4){
                    Text(user.username)
                        .font(.system(size: 14, weight : .semibold))
                    
                    Text(user.fullname)
                        .font(.system(size: 14))
                }
                .foregroundColor(.black)
            }
            Spacer()
        }.padding(.leading)
        
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
