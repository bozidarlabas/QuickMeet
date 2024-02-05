//
//  AppointmentListViewController+Design.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit

extension AppointmentListViewController: ConstructViewsProtocol  {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        
    }
    
    func styleViews() {
        view.backgroundColor = .white
    }
    
    func defineLayoutForViews() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
}
