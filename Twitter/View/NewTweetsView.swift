//
//  NewTweetsView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI
import Kingfisher

struct NewTweetsView: View {
    @Binding var isPresented : Bool
    @State var captionText: String = ""

    
    @ObservedObject var viewModel : UploadTweetViewModel
    
    // dismiss view on completion of new tweet being added
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    // (tip) in order to use Kingfisher images based on user info you need to check that there is a user
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                        
                    
                    TextArea("What's happening", text: $captionText)
                   
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(
                    leading:
                        Button(action: {
                            isPresented.toggle()
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(.blue)
                        })
                    
                    , trailing:
                        Button(action: {
                          viewModel.uploadTweet(caption: captionText)
                            
                            // Alternitive way to Dismiss but via Completion instead of binding
//                            viewModel.uploadTweet(caption: captionText) { _ in
//                                isPresented.toggle()
//                            }
                        }, label: {
                            Text("Tweet")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        })
                )
                Spacer()
            }
        }
    }
}

struct NewTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetsView(isPresented: .constant(false))
    }
}
