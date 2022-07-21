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
    @State var isSecureField: Bool? = false
    var eyeIcon: Bool? = true
    var showEye: Bool? = false
    
    var body: some View {
        VStack{
            if showEye ?? false{
            HStack{
                Image(systemName: imageName)
                    .resizable().scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                
                if isSecureField ?? false{
                    SecureField(placeholder, text: $text)
                }else{
                    TextField(placeholder, text: $text)
                }
                Divider().frame(width: 2, height: 20).background(Color.black)
                if eyeIcon ?? false{
                    Button {
                        isSecureField?.toggle()
                    } label: {
                        Image(systemName: buttonImage)
                    }
                    .foregroundColor(.black)
                }
            }
            Divider().background(Color.gray)
            }else{
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
    }
}

struct CustonTextFeilds_Previews: PreviewProvider {
    static var previews: some View {
        CustonTextFeilds(imageName: "envelope", placeholder: "Email", text: .constant(""), isSecureField: false, eyeIcon: true)
    }
}
extension CustonTextFeilds{
    var buttonImage:String {
        if isSecureField == true{
            return "eye.slash.fill"
        }else{
            return "eye.fill"
        }
    }
}
