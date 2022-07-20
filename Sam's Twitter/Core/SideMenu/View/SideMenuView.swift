//
//  SideMenuView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 22){
            //MARK: Profile Header
            VStack(alignment: .leading){
                
                VStack(alignment: .leading, spacing: 4){
                    Circle()
                        .frame(width: 48, height: 48)
                    
                    Text("Sam Grover")
                        .font(.headline)
                    
                    Text("@Ironman")
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
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }else if viewModel == .logout{
                    Button {
                        
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

