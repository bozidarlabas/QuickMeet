//
//  UIView+DropShadow.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

extension UIView {
    
    func dropShadow(
        color: UIColor = .black,
        offSet: CGSize = CGSize(width: 5, height: 10),
        radius: CGFloat = 10,
        shadowOpacity: Float = 0.3) {
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowOffset = offSet
            self.layer.shadowRadius = radius
        }
    
}
