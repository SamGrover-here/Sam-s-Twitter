//
//  ProfileViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation

class ProfileViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    private let userService = UserService()
    private let service = TweetService()
    let user: User
    
    init(user: User){
        // call all these functions while creating this viewModel
        
        self.user = user
        self.featchUserTweets()
        self.featchLikedTweets()
    }
    
    var actionButtonTitle: String{
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
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
    
    func featchLikedTweets(){
        guard let uid = user.id else { return }
        
        service.featchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
            
            
            for i in 0 ..< tweets.count{
                let uid  = tweets[i].uid
                
                self.userService.featchUser(withUid: uid) { user in
                    self.likedTweets[i].user = user
                }
            }
        }
    }
}
