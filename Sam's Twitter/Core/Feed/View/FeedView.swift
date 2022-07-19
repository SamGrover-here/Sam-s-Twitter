//
//  FeedView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...20, id: \.self){
                    _ in
                    TweetsRowView()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
