//
//  Sam_s_TwitterApp.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI
import Firebase

@main
struct Sam_s_TwitterApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                //ContentView()
                // LoginView() if there is no user logged in
                ProfileSelectorView()
            }.environmentObject(viewModel)
        }
    }
}
