//
//  FeedViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    
    let service = TweetService()
    let userService = UserService()
    init(){
        featchTweets()
    }
    func featchTweets(){
        service.featchTweets { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count{
                let uid  = tweets[i].uid
                
                self.userService.featchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}
