//
//  VerifiedBadge.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 25/07/22.
//

import SwiftUI

struct VerifiedBadge: View {
    var body: some View {
        Image(systemName: "checkmark.seal.fill")
            .foregroundColor(Color.blue)
    }
}

struct VerifiedBadge_Previews: PreviewProvider {
    static var previews: some View {
        VerifiedBadge()
    }
}
