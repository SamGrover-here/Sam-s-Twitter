//
//  NewTweetView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentataionMode
    var body: some View {
        VStack{
            HStack{
                //cancel button
                Button {
                    presentataionMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel").foregroundColor(.blue)
                }
                Spacer()
                //tweet Button
                Button {
                    
                } label: {
                    Text("Tweet")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
            
            HStack(alignment: .top){
                Circle().frame(width: 64, height: 64)
                TextArea("What's Happening", text: $caption)
                    
            }
        }.padding()
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
