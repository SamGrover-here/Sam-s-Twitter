//
//  TweetsRowView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            //MARK: Profile Image
            HStack(alignment: .top, spacing: 12){
                Circle().frame(width: 56, height: 56)
                    .foregroundColor(Color.blue)
                
                //MARK: User Info
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text("Sam Grover")
                            .font(.subheadline)
                            .bold()
                        
                        Text("@Ironman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    //MARK: Tweet
                    Text("I am Ironman")
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

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
