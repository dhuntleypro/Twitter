//
//  SearchView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<100) { _ in
                 //   HStack { Spacer() } // quick spacing notation
                    NavigationLink(destination: UserProfileView()) {
                        UserCell()
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
