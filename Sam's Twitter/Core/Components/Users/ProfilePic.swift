//
//  ProfilePic.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import SwiftUI
import Kingfisher

struct ProfilePic: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser{
            if user.profileImageUrl == ""{
                Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
                    .scaledToFill()
                    
                    .foregroundColor(.blue)
            }else{
                
                //MARK: Profile Image Uploaded
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    
            }
        }
    }
}

struct ProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePic()
    }
}
