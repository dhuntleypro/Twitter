//
//  UserProfileView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
            }
        }
        .navigationTitle("Batman")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
