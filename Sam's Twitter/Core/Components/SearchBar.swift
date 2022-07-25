//
//  SearchBar.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search Personality", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .overlay{
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                            .foregroundColor(.blue)
                    }
                }
            
        }.padding(.horizontal, 4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
