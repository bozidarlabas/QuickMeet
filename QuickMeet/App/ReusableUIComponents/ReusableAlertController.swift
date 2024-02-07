//
//  ReusableAlertController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class ReusableAlertController: UIAlertController {
    
    convenience init(title: String?, message: String?, showCancelButton: Bool = true, okButtonTitle: String?, completionHandler: (() -> Void)? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okButtonTitle, style: .default) { _ in
            completionHandler?()
        }
        addAction(okAction)
        
        if showCancelButton {
            let cancelAction = UIAlertAction(title: "title_cancel".localized, style: .cancel, handler: nil)
            addAction(cancelAction)
        }
    }
}
