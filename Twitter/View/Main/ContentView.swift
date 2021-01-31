//
//  ContentView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                
                NavigationView {
                    VStack {
                        MainTabView(selectedIndex : $selectedIndex)
                    }
                    .navigationBarTitle(viewModel.tabTitle(forIndex: selectedIndex))
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
                
            }
        }
        
    }
}
//            if viewModel.userSession != nil {
//
//                NavigationView {
//                    VStack {
//                    MainTabView()
//
//
//                    }
//                    .navigationBarItems(
//                        leading:
//                            Button(action: {
//
//                            }) {
//                                if let user = viewModel.user {
//                                    //    KFImage(URL(string: viewModel.user?.profileImageURL ?? ""))
//                                    KFImage(URL(string: user.profileImageURL))
//                                        .resizable()
//                                        .scaledToFill()
//                                        .clipped()
//                                        .frame(width: 32, height: 32)
//                                        .cornerRadius(16)
//
//                                }
//                            }
//                    )
//                }
//            } else {
//                LoginView()
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
