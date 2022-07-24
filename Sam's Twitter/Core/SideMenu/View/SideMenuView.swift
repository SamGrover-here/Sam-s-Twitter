//
//  SideMenuView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var  authViewModel: AuthViewModel
    var body: some View {
        if let user = authViewModel.currentUser{
            VStack (alignment: .leading, spacing: 22){
                //MARK: Profile Header
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading, spacing: 4){
                        
                        //MARK: Default Profile Image
                        ProfilePic().frame(width: 48, height: 48)
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    UserStatus()
                }
                .padding(.leading)
                Divider()
                
                //MARK: Profile option List
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                    
                    if viewModel == .profile{
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    }else if viewModel == .logout{
                        Button {
                            // Logout here
                            authViewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    }
                    else{
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }
                Spacer()
            }.padding(.top, 30)
        }
    }
}


