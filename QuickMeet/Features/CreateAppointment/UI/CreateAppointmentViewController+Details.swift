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
        view.addSubview(stackview)
        stackview.addArrangedSubview(dateView)
        dateView.label.text = "title_date".localized
        stackview.addArrangedSubview(timeView)
        timeView.label.text = "title_time".localized
        stackview.addArrangedSubview(locationDropdownView)
        locationDropdownView.label.text = "title_location".localized
        locationDropdownButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        locationDropdownButton.showsMenuAsPrimaryAction = true
        locationDropdownButton.changesSelectionAsPrimaryAction = true
        
        view.addSubview(descriptionTextView)
        descriptionTextView.placeholder = "title_description".localized
        
        view.addSubview(backButton)
        backButton.setBackgroundImage(UIImage(named: "icon_back"), for: .normal)
        
        view.addSubview(saveButton)
        saveButton.setTitle("title_save".localized, for: .normal)
    }
    
    func styleViews() {
        view.backgroundColor = .secondaryColor
        
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.alignment = .fill
//        stackview.spacing = 15
        
        dateView.setPickerMode(.date)
        timeView.setPickerMode(.time)
        
        locationLabel.textColor = .white
        locationLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        descriptionTextView.textColor = .white
        descriptionTextView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 4
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.tintColor = .white
        descriptionTextView.font = UIFont.systemFont(ofSize: 20.0)
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        backButton.contentMode = .scaleAspectFit
        backButton.imageView?.contentMode = .scaleAspectFit

        saveButton.backgroundColor = .blueColor
        saveButton.layer.cornerRadius = 4
        saveButton.clipsToBounds = true
    }
    
    func defineLayoutForViews() {
        stackview.translatesAutoresizingMaskIntoConstraints = false
        dateView.translatesAutoresizingMaskIntoConstraints = false
        locationDropdownView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        // backButton button
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.heightAnchor.constraint(equalToConstant: 35),
        ])
        
        // Date label layout
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 15),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackview.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: -15)
        ])
        
//         descriptionTextView layout
        NSLayoutConstraint.activate([
            descriptionTextView.leadingAnchor.constraint(equalTo: stackview.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: stackview.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // saveButton layout
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            saveButton.leadingAnchor.constraint(equalTo: stackview.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: stackview.trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
}
