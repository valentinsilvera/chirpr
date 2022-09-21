//
//  RoundedShape.swift
//  Chirpr
//
//  Created by Valentin Silvera on 19/9/22.
//

import Foundation
import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    var radii: Int
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}
