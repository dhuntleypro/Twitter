//
//  SearchView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    // VIEW MODEL
    @ObservedObject var viewModel = SearchViewModel()
    
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)) { user in
                 
                    NavigationLink(destination: LazyView(UserProfileView(user: user))) {
                        UserCell(user: user)
                    }
                }
            }
        }
        .navigationTitle("Search")
        .navigationBarTitle("test")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
