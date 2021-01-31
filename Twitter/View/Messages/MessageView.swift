//
//  MessageView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                HStack {
                    Spacer()
                    
                    Text(message.text)
                        .padding()
                        .background(Color.blue)
                        .clipShape(ChatBubble(isFromCurrentUser: true))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.leading, 100)
                        .padding(.trailing, 16)
                }
            } else {
                HStack(alignment: .bottom) {
                    KFImage(URL(string: message.user.profileImageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                    
                    
                    
                }
                .padding(.horizontal)
                .padding(.trailing, 100)
                .padding(.leading, 16)
                
                Spacer()
                
            }
        }
    }
}

//
//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(message: MOCK_MESSAGES[0])
//    }
//}
