//
//  ProfileView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading){
            
//extention Made Below
            
            //header
            HeaderView
            // action buttons: bell and edit profile
            ActionButtons
            //User info
            UserInfoDetail
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
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                    .foregroundColor(Color.black)
            }
            
        }
        .padding(.trailing)
    }
    
    var UserInfoDetail: some View {
        VStack(alignment: .leading, spacing: 4){
            
            //MARK: Name, Username and Bio
            HStack{
                Text("Sam Grover")
                    .font(.title2)
                    .bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color.blue)
            }
            Text("@Ironman")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("You Know who I am")
                .font(.subheadline)
                .padding(.vertical)
                .multilineTextAlignment(.leading)
            
            //MARK: Location and link
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Hisar, Haryana")
                }
                
                HStack{
                    Image(systemName: "link")
                    Text("https://github.com/SamGrover-here")
                }
            }
            .foregroundColor(.gray)
            .font(.caption)
            
            //MARK: Follower and Following
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
            
        }.padding(.horizontal, 20)
    }
}
