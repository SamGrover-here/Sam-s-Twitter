//
//  ExploreViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchedUsers: [User]{
        if searchText.isEmpty{
            return users
        }else{
            let lowercaseQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercaseQuery) ||
                $0.fullname.lowercased().contains(lowercaseQuery)
            })
        }
    }
    
    let service = UserService()
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.featchUsers(completion: { users in
            self.users = users
            
            //print("DEBUG: Users are \(users)")
        })
    }
}
