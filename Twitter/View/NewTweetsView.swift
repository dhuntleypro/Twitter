//
//  NewTweetsView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

struct NewTweetsView: View {
    @Binding var isPresented : Bool
    @State var captionText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
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
                        Button(action: {}, label: {
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
