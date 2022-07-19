//
//  ExploreTabView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI

struct ExploreTabView: View {
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(0...20, id: \.self){ _ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }
                    }
                }
            }.navigationTitle("Explore").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreTabView()
    }
}
