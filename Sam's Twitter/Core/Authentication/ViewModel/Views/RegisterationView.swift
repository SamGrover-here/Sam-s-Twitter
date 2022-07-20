//
//  RegisterationView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct RegisterationView: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            AuthenticationHeader(title1: "Get started.", title2: "Create your account")
            
            
            VStack(spacing: 40){
                CustonTextFeilds(imageName: "envelope", placeholder: "Email", text: $email)
                
                CustonTextFeilds(imageName: "eye.fill", placeholder: "User name", text: $userName)
                
                CustonTextFeilds(imageName: "person", placeholder: "Full name", text: $fullName)
                
                CustonTextFeilds(imageName: "lock", placeholder: "Password", text: $password)
            }.padding(32)
            
            
            Button {
                // sign In here
            } label: {
                Text("Sign Up!")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            Spacer()
            //Below text
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.caption)
                    
                    Text("Sign In!")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 32)
                .foregroundColor(.blue)
            }
            
        }.ignoresSafeArea()
    }
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}
