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
    @ObservedObject var viewModel = SearchViewModel()

    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                 //   HStack { Spacer() } // quick spacing notation
                    // (Tip) gives navigation an formula
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        UserCell(user: user)

                    })
                }
            }
        }
        .navigationTitle("Search")
        .navigationBarTitle("test")
    }
}


struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(false), startChat: .constant(false))
    }
}
