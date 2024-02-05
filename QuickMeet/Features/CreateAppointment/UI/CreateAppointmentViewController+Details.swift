//
//  CreateAppointmentViewController+Details.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation
import UIKit

extension CreateAppointmentViewController: ConstructViewsProtocol  {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        
    }
    
    func styleViews() {
        view.backgroundColor = .secondaryColor
        
    }
    
    func defineLayoutForViews() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
}
