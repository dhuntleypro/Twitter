//
//  CoversationCell.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message : Message
    
    
    var body: some View {
        
        VStack {
            HStack(spacing: 12){
                KFImage(URL(string: message.user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4){
                    Text(message.user.fullname)
                        .font(.system(size: 14, weight : .semibold))
                    
                    
                    Text(message.text)
                        // (Tip) increase size by 1 and set line limit to wrap text (multi line) or give the VStack a height
                        .font(.system(size: 15))
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .padding(.trailing)
                
                
                
                Spacer()
                
            }
            Divider()
        }
    }
}

