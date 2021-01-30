//
//  MessageInputView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
   // let viewModel : ChatViewModel
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: action) {
                Text("Send")

            }
            
//            Button(action: {
//                viewModel.sendMessage(messageText)
//
//            }, label: {
//                Text("Send")
//            })
        }
    }
}

//struct MessageInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageInputView(messageText: .constant("Message..."))
//    }
//}
