//
//  AuthViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 21/07/22.
//

import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    init(){
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: failed to sign in with error: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            print("DEBUG: Logged in user sucessfully")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("DEBUG: failed to register with error: \(error.localizedDescription)")
            }
            guard let user = result?.user else {return}
            self.userSession = user
            
            print("DEBUG: Registered user sucessfully")
            print("DEBUG: Registering user named: \(self.userSession)")
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did uploaded user data")
                }
        }
    }
    
    func signOut(){
        // set user session to nil
        userSession = nil
        
        //log out user on serverside
        try? Auth.auth().signOut()
    }
}
