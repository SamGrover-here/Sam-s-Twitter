//
//  LoginView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        //Parent Container
        VStack{
            //MARK: Header View
            AuthenticationHeader(title1: "Hello,", title2: "Welcome Back!")
            
            //MARK: Login Text view
            
            VStack(spacing: 40){
                CustonTextFeilds(imageName: "envelope", placeholder: "Email", text: $email)
                
                CustonTextFeilds(imageName: "lock.fill", placeholder: "Password", text: $password, showEye: true)
            }.padding(.horizontal, 32)
                .padding(.top, 42)
                
            HStack{
                Spacer()
                NavigationLink{
                    Text("reset Password View")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                // sign In here
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
            }

            Spacer()
            
            NavigationLink {
                RegisterationView().navigationBarHidden(true)
            }label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.caption)
                    
                    Text("Sign Up!")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }.padding(.bottom, 32)
                .foregroundColor(.blue)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
