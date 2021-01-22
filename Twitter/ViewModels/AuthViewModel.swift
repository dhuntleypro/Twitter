//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession : FirebaseAuth.User?  // keep track if user is logged in
    @Published var isAuthenticating = false // period during the log in process loading
    @Published var error : Error? // if error show alert
 //   @Published var user: User? // keep track of the user - Help load user data (going to use our own)
    
    init() {
        // SHOW THE CORRECT VIEW - IS THERE A USER ?
        userSession = Auth.auth().currentUser
        
        // GETS THE DATA
        fetchUser()
        
        
    }
    
    
    func login(withEmail email: String , password: String)  {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("DEBUG: Fail tp upload image \(error.localizedDescription)")
                return

            }
            
            // LOGIN USER
            self.userSession = result?.user
            print("DEBUG: Successfully logged in")

        }

    }
    
    
    func register(email: String , password: String , username: String , fullname: String, profileImage: UIImage) {
        
        // UPLOAD THE IMAGE UOLOADED BY NEW USER
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Fail tp upload image \(error.localizedDescription)")
            }
            
            
            storageRef.downloadURL { url, _ in
                guard let profileImageURL = url?.absoluteString else { return }
                
                
                // CREATE AUTHENTICATE NEW USER
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return // if error - print error and stop
                    }
                    
                    print("DEBUG: Successfully signup user...")
                    print("DEBUG: Email is \(email)")
                    
                    // CHECK IF USER EXIST
                    guard let user = result?.user else { return }
                    
                    // ADD TO COLLECTION IN CLOUD FIREBASE
                    let data = ["email" : email,
                                "username" : username.lowercased(),
                                "fullname" : fullname,
                                "profileImageURL" : profileImageURL,
                                "uid" : user.uid
                    ]
                    
                    
                    
                    Firestore.firestore()
                        .collection("users")
                        .document(user.uid)
                        .setData(data) { _ in
                            self.userSession = user
                            print("DEBUG: Successfully uploaded user data to cloud firebase")
                        }
                }
            }
        }
    }
    
    
    func signOut() {
        userSession = nil
        
        try? Auth.auth().signOut()
        print("User has signed out")
    }
    
    // FETCH USER INFORMATION
    func fetchUser() {
        guard let uid = userSession?.uid else { return }

        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            // usually no error in firebase so no need in include error just _
            .getDocument { (snapshot, _) in
                guard let data = snapshot?.data() else { return }
                let user = User(dictionary: data)
                print("DEBUG: User is \(user.username)")
            }
    }
}
