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
    
    
    
    var body: some Scene {
        WindowGroup {
           // ContentView()
            LoginView()
            
        }
    }
}
