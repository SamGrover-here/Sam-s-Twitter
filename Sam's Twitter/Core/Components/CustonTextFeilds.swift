//
//  CustonTextFeilds.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct CustonTextFeilds: View {
    let imageName: String
    let placeholder: String
    @Binding var text: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable().scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholder, text: $text)
            }
            Divider().background(Color.gray)
        }
    }
}

struct CustonTextFeilds_Previews: PreviewProvider {
    static var previews: some View {
        CustonTextFeilds(imageName: "envelope", placeholder: "Email", text: .constant(""))
    }
}
