//
//  UserService.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 22/07/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func featchUser(withUid uid: String , completion: @escaping(User) -> Void){
        print("DEBUG: Featch user info")
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument{ snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
                print("DEBUG: username is \(user.username)")
            }
    }
    
    func featchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()

        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { document in
                    guard let user = try? document.data(as: User.self) else { return }
                    users.append(user)
                }
                completion(users)
            }
    }
}

//        Firestore.firestore().collection("users")
//            .getDocuments { snapshot, _ in
//                guard let documents = snapshot?.documents else {return}
//                let users = documents.compactMap ({try? $0.data(as: User.self)})
//
//                completion(users)
