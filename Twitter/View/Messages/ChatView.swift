//
//  ChatView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

struct ChatView: View {
    let user : User
    let viewModel: ChatViewModel
    @State var messageText = ""
    
    init(user : User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading , spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        MessageView(message: message)
                    }
                }
            }
            .padding(.top)
            
           // MessageInputView(messageText: $messageText)
            MessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
        }
        .navigationTitle(user.username)
    }
    
    func sendMessage () {
        viewModel.sendMessage(messageText)
    }
}



