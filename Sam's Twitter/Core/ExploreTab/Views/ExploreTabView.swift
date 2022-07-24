//
//  ExploreTabView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI

struct ExploreTabView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    ForEach(viewModel.users){ user in
                        NavigationLink {
                           ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }.navigationTitle("Home").navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreTabView()
    }
}
