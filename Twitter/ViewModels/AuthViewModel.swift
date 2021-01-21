//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func register(email: String , password: String , username: String , fullname: String, profileImage: UIImage) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return // if error - print error and stop
            }
        }
        
        print("DEBUG: Successfully signup user...")
        print("DEBUG: Email is \(email)")
        print("DEBUG: Password is \(password)")
        
     
    }
    
}
