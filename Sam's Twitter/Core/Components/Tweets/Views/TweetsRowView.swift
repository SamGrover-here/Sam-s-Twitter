//
//  TweetsRowView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI
import Kingfisher

struct TweetsRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet){
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            //MARK: Profile Image
            if let user = viewModel.tweet.user{
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color.blue)
                    
                    //MARK: User Info
                    VStack(alignment: .leading, spacing: 5){
                        
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
                        
                        
                        //MARK: Tweet
                        Text(viewModel.tweet.caption)
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
                        viewModel.tweet.didLike  ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                    } label: {
                        Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                            .font(.subheadline)
                            .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
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
        }.padding()
    }
}
    
    //struct TweetsRowView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        TweetsRowView()
    //    }
    //}
