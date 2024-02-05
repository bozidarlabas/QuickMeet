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
        view.addSubview(dateLabel)
        dateLabel.text = "title_date".localized
 
        view.addSubview(dateTimePicker)
        
        view.addSubview(locationLabel)
        locationLabel.text = "title_location".localized
        
        view.addSubview(button)
        button.menu = UIMenu(options: .displayInline, children: menuChildren)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
    }
    
    func styleViews() {
        view.backgroundColor = .secondaryColor
        dateLabel.textColor = .white
        dateLabel.font = UIFont.systemFont(ofSize: 20.0)
        dateTimePicker.preferredDatePickerStyle = .compact
        dateTimePicker.backgroundColor = .white.withAlphaComponent(0.3)
        dateTimePicker.tintColor = .secondaryColor
        dateTimePicker.layer.cornerRadius = 4
        dateTimePicker.layer.masksToBounds = true
        
        locationLabel.textColor = .white
        locationLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        button.setImage(UIImage(named: "icon_dropdown"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
    }
    
    func defineLayoutForViews() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateTimePicker.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Date label layout
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        // DateTimePicker layout
        NSLayoutConstraint.activate([
            dateTimePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            dateTimePicker.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
        ])
        
        // locationButton button
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: dateTimePicker.bottomAnchor, constant: 15),
            locationLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor)
        ])
        
        // Locations dropdown
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
        ])
        
    }
    
}
