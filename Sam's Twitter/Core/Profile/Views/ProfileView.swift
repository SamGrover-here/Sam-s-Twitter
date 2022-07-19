//
//  ProfileView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            HeaderView
            //extention Made Below
            ActionButtons
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView{
    var HeaderView: some View{
        VStack{
            ZStack(alignment: .bottomLeading){
                Color(.systemBlue)
                    .ignoresSafeArea()
                
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .foregroundColor(.white)
                            .offset(x: 11, y: 12)
                    }
                    
                    Circle().frame(width: 72, height: 72)
                        .offset(x: 16, y: 24)
                }
            }.frame(height: 96)
        }
    }
    
    var ActionButtons: some View {
        HStack(spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                    .foregroundColor(Color.black)
            }
            
        }
        .padding(.trailing)
    }
}
