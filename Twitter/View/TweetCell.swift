//
//  TweetCell.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top , spacing: 12) {
                Image("batman")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2) // or .clipShape(Circle())
                    .padding(.leading)
                VStack(alignment: .leading , spacing: 4){
                    
                    
                    HStack {
                        Text("Bruce Wayne")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("@batman •")
                            .foregroundColor(.gray)
                        Text("2w")
                            .foregroundColor(.gray)
                        
                    }
                    
                    Text("It's not who I an underneath , but what I do that defines me")
                    
                }
            }
            .padding(.bottom)
            .padding(.trailing)

            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                Spacer()

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                
                Spacer()

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.leading , -16)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
