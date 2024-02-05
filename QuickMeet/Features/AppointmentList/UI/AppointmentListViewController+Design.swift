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
        view.addSubview(addAppointmentButton)
    }
    
    func styleViews() {
        view.backgroundColor = .white
        addAppointmentButton.backgroundColor = .secondaryColor
        addAppointmentButton.setImage(UIImage(named: "icon_plus"), for: .normal)
    }
    
    func defineLayoutForViews() {
        addAppointmentButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addAppointmentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            addAppointmentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            addAppointmentButton.heightAnchor.constraint(equalToConstant: 50),
            addAppointmentButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
