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
    
    func featchTweets(){
        Firestore.firestore().collection("tweets").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            documents.forEach { doc in
                print(doc.data())
            }
        }
    }
}
