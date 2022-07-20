//
//  Rounded Shape.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 20/07/22.
//

import Foundation
import SwiftUI
struct RounderdShape: Shape{
    var corners: UIRectCorner
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        return Path(path.cgPath)
    }
}
