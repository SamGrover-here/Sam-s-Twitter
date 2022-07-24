//
//  ExploreViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init(){
        
    }
    
    func fetchUsers(){
        service.featchUsers(completion: { users in
            self.users = users
            print("DEBUG: Users are \(users)")
        })
    }
}
