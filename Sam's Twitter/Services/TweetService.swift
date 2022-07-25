//
//  TweetService.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import Foundation
import Firebase

struct TweetService{
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid, "caption": caption, "likes":0, "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Eroor uploading tweet: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
                print("DEBUG: Tweet uploaded sucessfully")
            }
    }
    
    func featchTweets(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self) })
                completion(tweets)
            }
    }
    
    func featchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self) })
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
    }
}