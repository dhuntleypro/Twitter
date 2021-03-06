//
//  ConversationsView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    @ObservedObject var viewModel = ConversationsViewModel()
        
    @State var user : User?
    var body: some View {
        ZStack(alignment: .bottomTrailing) { // floating bottom button (New tweet)
            
            // (Tip) Navgation that is only active with state of showChat
            if let user = user {
            NavigationLink( destination: LazyView(ChatView(user: user)),
                                            isActive: $showChat,
                                            label: {} )
            }
            ScrollView {
                VStack {
                    ForEach(viewModel.recentMessages) { message in
                        NavigationLink(destination: LazyView(ChatView(user: message.user))) {
                            ConversationCell(message: message
                            )
                            
                        }
                    }
                   
                }
                .padding()
            }
                
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white) // Change Image color
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat, user: $user)
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
