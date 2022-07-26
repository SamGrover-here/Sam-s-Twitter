//
//  AuthenticationHeader.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct AuthenticationHeader: View {
    let title1: String
    let title2: String
    var body: some View {
        VStack(alignment: .leading){
                        HStack{Spacer()}
                        
                        Text(title1)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        
                        Text(title2)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    .frame(height: 260)
                    .padding(.leading)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RounderdShape(corners: .bottomRight))
    }
}

struct AuthenticationHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeader(title1: "Welcome", title2: "Welcome Back!")
    }
}
