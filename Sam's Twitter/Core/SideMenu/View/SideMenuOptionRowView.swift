//
//  SideMenuOptionRowView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.Imagename)
                .font(.headline)
                .foregroundColor(.gray)
            
            
            Text(viewModel.title)
                .font(.subheadline)
                .foregroundColor(Color.black)
            
            
            Spacer()
        }.frame(height: 40).padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
