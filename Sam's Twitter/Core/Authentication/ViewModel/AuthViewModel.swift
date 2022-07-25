//
//  AuthViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 21/07/22.
//

import Foundation
import SwiftUI
import Firebase
import Kingfisher

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?    //set from featch data
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    init(){
        self.userSession = Auth.auth().currentUser
        
        //print("DEBUG: User session is \(self.userSession?.uid)")
        self.featchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: failed to sign in with error: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.featchUser()
            print("DEBUG: Logged in user sucessfully")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String, profileImageUrl: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("DEBUG: failed to register with error: \(error.localizedDescription)")
            }
            guard let user = result?.user else {return}
            //self.userSession = user
            self.tempUserSession = user
//            print("DEBUG: Registered user sucessfully")
//            print("DEBUG: Registering user named: \(self.userSession)")
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid, "profileImageUrl": profileImageUrl]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut(){
        // set user session to nil
        userSession = nil
        
        //log out user on serverside
        try? Auth.auth().signOut()
    }
    
     func uploadProfileImage(_ image: UIImage){
         guard let uid = tempUserSession?.uid else {return}
         
         ImageUploader.uploadImage(image: image) { profileImageUrl in
             Firestore.firestore().collection("users")
                 .document(uid)
                 .updateData(["profileImageUrl": profileImageUrl]) { _ in
                     self.userSession = self.tempUserSession
                     self.featchUser()
                     print("DEBUG: Updated the firebase")
                 }
         }
//         ImageUploader.uploadImage(image: image) { profileImageUrl in
//             Firestore.firestore().collection("users")
//                 .document(uid)
//                 .updateData(["profileImageUrl": profileImageUrl]) { _ in
//                     self.userSession = self.tempUserSession
//                     self.featchUser()
//                 }
//        }
    }
    
    func featchUser(){
        guard let uid = self.userSession?.uid else {return}
        service.featchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
