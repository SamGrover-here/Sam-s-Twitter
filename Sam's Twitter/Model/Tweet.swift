//
//  Tweet.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    let uid: String  // user id of auther
    
    var user: User?
}
