//
//  ProfileViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation

class ProfileViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user: User
    
    init(user: User){
        self.user = user
        self.featchUserTweets()
    }
    
    func featchUserTweets(){
        guard let uid = user.id else { return }
        service.featchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0..<tweets.count{
                self.tweets[i].user = self.user
            }
        }
    }
}
