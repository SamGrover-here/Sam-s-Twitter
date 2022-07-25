//
//  FeedViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    
    let service = TweetService()
    init(){
        featchTweets()
    }
    func featchTweets(){
        service.featchTweets()
    }
}
