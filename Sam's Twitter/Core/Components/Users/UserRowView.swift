//
//  UserRowView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        VStack {
            HStack{
                Circle().frame(width: 48, height: 48)
                VStack(alignment: .leading,spacing: 5){
                    HStack(spacing: 2){
                        Text("Jigs Jasper")
                            .font(.subheadline).bold()
                            .foregroundColor(.black)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                    Text("@JigsJasper")
                        .font(.subheadline).bold().foregroundColor(.gray)
                }
                Spacer()
                
            }.padding(.horizontal)
                .padding(.vertical, 7)
            Divider()
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
