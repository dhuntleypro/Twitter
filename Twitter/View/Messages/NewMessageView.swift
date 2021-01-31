//
//  NewMessageView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

struct NewMessageView: View {
    
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)

    @Binding var user : User?

    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)) { user in
                    //   HStack { Spacer() } // quick spacing notation
               
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                        self.user = user
                    }, label: {
                        UserCell(user: user)

                    })
                }
            }
            .padding(.leading)
        }
    }
}

//
//struct NewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMessageView(show: .constant(false), startChat: .constant(false))
//    }
//}
