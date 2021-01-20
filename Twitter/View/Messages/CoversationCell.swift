//
//  CoversationCell.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        HStack {
            VStack {
            HStack(spacing: 12){
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("venom")
                        .font(.system(size: 14, weight : .semibold))
                
                    
                    Text("sijdoivjoivjoijvoidjvidjvoijdvoidjvoijvoijiojdojfoivjfdjifdjvodfijofvojfdijvdbbf")
                        // (Tip) increase size by 1 and set line limit to wrap text (multi line) or give the VStack a height
                        .font(.system(size: 15))
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .padding(.trailing)
            
            }
            
            Divider()
            }
            Spacer()
            
        }.padding(.leading)
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
