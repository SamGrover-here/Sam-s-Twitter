//
//  Users.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 22/07/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    var profileImageUrl: String
    let email: String
}
