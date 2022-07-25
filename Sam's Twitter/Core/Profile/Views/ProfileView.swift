//
//  ProfileView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var profileViewModel: ProfileViewModel

    
    init(user: User){
        self.profileViewModel = ProfileViewModel(user: user)
    }
    
    @Environment(\.presentationMode) var mode
    var body: some View {
        VStack(alignment: .leading){
            
//extention Made Below
             
            //header
            HeaderView
            // action buttons: bell and edit profile
            ActionButtons
            //User info
            UserInfoDetail
            //filter of tweets: tweets, replies and likes
            TweetFilter
            
            //the tweet view
            if selectedFilter == .tweets{
                TweetsView
            }else{
                Text(selectedFilter.title)
            }
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "@Ironman",
                               fullname: "Sam Grover",
                               profileImageUrl: "",
                               email: "abc@gmail.com"))
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
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .foregroundColor(.white)
                            .offset(x: 16, y: -4)
                    }
                    //MARK: Profile image
                    ZStack{
                        
                        Circle().foregroundColor(.white).frame(width: 65, height: 72)
                            .offset(x: 20, y: 24)
                        ProfilePic().frame(width: 72, height: 72)
                            .offset(x: 16, y: 24)
                    }
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
                Text(profileViewModel.actionButtonTitle)
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
                Text(profileViewModel.user.fullname)
                    .font(.title2)
                    .bold()
                VerifiedBadge()
            }
            Text("@\(profileViewModel.user.username)")
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
            UserStatus()
            
        }.padding(.horizontal, 20)
    }
    var TweetFilter: some View{
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule().foregroundColor(Color.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule().foregroundColor(Color.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }.overlay(Divider().offset(x: 0, y: 17))
    }
    
    var TweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(profileViewModel.tweets(forFilter: self.selectedFilter)){
                    tweet in
                    TweetsRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
