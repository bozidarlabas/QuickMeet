//
//  PaddedTextField.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class PaddedTextField: UITextField {

    let padding = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
