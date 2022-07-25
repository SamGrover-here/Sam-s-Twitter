//
//  ProfileSelectorView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 21/07/22.
//

import SwiftUI

struct ProfileSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?   // Image selecteded iin Uikit
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        VStack{
            AuthenticationHeader(title1: "Customize me,", title2: "Add a profile photo,")
            
            //MARK: Skip button
            HStack{
                Spacer()
                Button {
                    let uiImage = UIImage(systemName: "person.crop.circle.badge.plus")
                    selectedImage = uiImage
                    
                } label: {
                    Text("Skip").padding(.horizontal, 30)
                        .padding(.vertical)
                }
            }
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage{
                    VStack(spacing: 20){
                        profileImage.resizable()
                            .clipShape(Circle())
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                        Text("Edit")
                            .foregroundColor(.white)
                            .bold()
                            .background(Capsule().frame(width: 100, height: 40))
                    }
                    
                }else{
                    VStack(spacing: 30){
                        Image(systemName: "person.crop.circle.badge.plus").resizable().scaledToFit().frame(width: 100, height: 100).foregroundColor(.blue)
                        
                        
                        Text("Select")
                            .foregroundColor(.white)
                            .bold()
                            .background(Capsule().frame(width: 100, height: 40))
                    }
                }
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }.padding(.top, 44)
            
            
            Spacer()
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                    print("DEBUG: finished regestering user")
                    //ContentView().mainInterfaceView
                    
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
                }
            }
            Spacer()
            
        }.ignoresSafeArea()
    }
    func loadImage(){
        guard let selectedImage = selectedImage else{return}
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfileSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectorView()
    }
}
