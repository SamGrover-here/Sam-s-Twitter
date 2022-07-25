//
//  NewTweetView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentataionMode
    @EnvironmentObject var authviewModel: AuthViewModel
    @ObservedObject var viewModel =  UploadTweetViewModel()
    var body: some View {
        VStack{
            HStack{
                //cancel button
                Button {
                    presentataionMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel").foregroundColor(.blue)
                }
                Spacer()
                //tweet Button
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
            
            HStack(alignment: .top){
                if let user = authviewModel.currentUser{
                    ProfilePic().frame(width: 50, height: 50)
                }
                TextArea("What's Happening", text: $caption)
            }
            
        }.padding()
        .onReceive(viewModel.$didUploadedTweet) { sucess in
            if sucess{
                presentataionMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
