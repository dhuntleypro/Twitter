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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) { // floating bottom button (New tweet)
            ScrollView {
                // (Tip) Navgation that is only active with state of showChat
                NavigationLink( destination: ChatView(),
                                isActive: $showChat,
                                label: {} )

                //LazyVStack { // Only load cells as they become visable on screen
                VStack {
                    ForEach(0..<24) { _ in
                        NavigationLink(destination: ChatView()) {
                            ConversationCell()
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
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
