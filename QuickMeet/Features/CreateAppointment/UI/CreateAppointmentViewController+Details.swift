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
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addSubview(stackview)
        stackview.addArrangedSubview(dateView)
        dateView.label.text = "title_date".localized
        stackview.addArrangedSubview(timeView)
        timeView.label.text = "title_time".localized
        stackview.addArrangedSubview(locationDropdownView)
        locationDropdownView.label.text = "title_location".localized
        
        stackview.addArrangedSubview(addToCalendarView)
        addToCalendarView.label.text = "title_add_to_calendar".localized
        
        stackview.addArrangedSubview(addNotificationView)
        addNotificationView.label.text = "title_noty_me".localized
        
        locationDropdownButton.showsMenuAsPrimaryAction = true
        locationDropdownButton.changesSelectionAsPrimaryAction = true
        
        scrollViewContainer.addSubview(descriptionTextView)
        descriptionTextView.placeholder = "title_description".localized
        
        scrollViewContainer.addSubview(descriptionTextViewButton)
        
        view.addSubview(backButton)
        backButton.setBackgroundImage(UIImage(named: "icon_back"), for: .normal)
        
        view.addSubview(saveButton)
        saveButton.setTitle("title_save".localized, for: .normal)
        
        let closeButton = UIBarButtonItem(title: "title_close".localized, style: .plain, target: self, action: #selector(closeSelected))
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar?.setItems([flexibleSpace, closeButton], animated: false)
        descriptionTextView.inputAccessoryView = toolbar
    }
    
    func styleViews() {
        view.backgroundColor = .secondaryColor
        
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.alignment = .fill
        
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

        saveButton.backgroundColor = .itemColor
        saveButton.layer.cornerRadius = 4
        saveButton.clipsToBounds = true
        scrollView.backgroundColor = .clear
        
        descriptionTextViewButton.backgroundColor = .clear
        scrollViewContainer.backgroundColor = .clear
    }
    
    func defineLayoutForViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        stackview.translatesAutoresizingMaskIntoConstraints = false
        dateView.translatesAutoresizingMaskIntoConstraints = false
        locationDropdownView.translatesAutoresizingMaskIntoConstraints = false
        addToCalendarView.translatesAutoresizingMaskIntoConstraints = false
        addNotificationView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        // UIScrollView constraints
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 1),
            scrollView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -15)
        ])
        
        // scrollStackViewContainer constraints
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: -30)
        ])
        
        // backButton button
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.heightAnchor.constraint(equalToConstant: 35),
        ])
        
        // Date label layout
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 15),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackview.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: -15)
        ])
        
        // descriptionTextView layout
        NSLayoutConstraint.activate([
            descriptionTextView.leadingAnchor.constraint(equalTo: stackview.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: stackview.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200),
            descriptionTextView.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor, constant: -15),
        ])
        
        // saveButton layout
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            saveButton.leadingAnchor.constraint(equalTo: stackview.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: stackview.trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            descriptionTextViewButton.bottomAnchor.constraint(equalTo: descriptionTextView.bottomAnchor),
            descriptionTextViewButton.leadingAnchor.constraint(equalTo: descriptionTextView.leadingAnchor),
            descriptionTextViewButton.trailingAnchor.constraint(equalTo: descriptionTextView.trailingAnchor),
            descriptionTextViewButton.topAnchor.constraint(equalTo: descriptionTextView.topAnchor)
        ])
        
    }
    
}
