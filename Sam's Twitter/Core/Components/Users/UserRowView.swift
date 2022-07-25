//
//  UserRowView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        VStack {
            HStack(spacing: 12){
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading,spacing: 5){
                    
                    HStack(spacing: 2){
                        Text(user.fullname)
                            .font(.subheadline).bold()
                            .foregroundColor(.black)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                    Text("@\(user.username)")
                        .font(.subheadline).bold().foregroundColor(.gray)
                }
                Spacer()
                
            }.padding(.horizontal)
                .padding(.vertical, 7)
            Divider()
        }
    }
}

