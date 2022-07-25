//
//  UploadTweetViewModel.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation

class UploadTweetViewModel: ObservableObject{
    @Published var didUploadedTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption) { sucess in
            if sucess
            {
                // dismiss screen
                self.didUploadedTweet = true
            }else{
                // show error message
            }
        }
    }
}
