//
//  UserStatus.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct UserStatus: View {
    var body: some View {
        HStack(spacing: 24){
            
            HStack(spacing: 4){
                Text("10")
                    .bold()
                    .font(.subheadline)
                Text("Following")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            HStack(spacing: 4){
                Text("20k")
                    .bold()
                    .font(.subheadline)
                Text("Followers")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }.padding(.vertical)
    }
}

struct UserStatus_Previews: PreviewProvider {
    static var previews: some View {
        UserStatus()
    }
}
