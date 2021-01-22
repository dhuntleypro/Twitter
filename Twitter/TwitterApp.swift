//
//  TwitterApp.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/19/21.
//

import SwiftUI
import Firebase

@main
struct TwitterApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    // https://github.com/onevcat/Kingfisher.git
    //
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel())
           // LoginView()
            
        }
    }
}
