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
            SearchBar(text: $viewModel.searchText).padding()
            ScrollView{
                VStack{
                    ForEach(viewModel.searchedUsers){ user in
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
