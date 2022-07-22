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
}
