//
//  TweetsRowView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI

struct TweetsRowView: View {
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading){
            //MARK: Profile Image
            HStack(alignment: .top, spacing: 12){
                ProfilePic().frame(width: 56, height: 56)
                    .foregroundColor(Color.blue)
                
                //MARK: User Info
                VStack(alignment: .leading, spacing: 5){
                    if let user = tweet.user{
                        HStack{
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    
                    //MARK: Tweet
                    Text(tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            // MARK: Action Labels
            HStack{
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left").font(.subheadline)
                }
                
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath").font(.subheadline)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "heart").font(.subheadline)
                }
                
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "bookmark").font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

//struct TweetsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsRowView()
//    }
//}
