//
//  AppointmentDetailsViewController+Design.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

extension AppointmentDetailsViewController: ConstructViewsProtocol  {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addSubview(firstContainer)
        scrollViewContainer.addSubview(secondContainer)
        
        secondContainer.addSubview(detailsLabel)
        secondContainer.addSubview(detailsDescriptionLabel)
        
        detailsLabel.text = "title_description".localized
        
        firstContainer.addSubview(dateView)
        dateView.label.text = "title_date".localized
        
        firstContainer.addSubview(locationView)
        locationView.label.text = "title_location".localized
        
        deleteButton.setImage(UIImage(named: "icon_delete"), for: .normal)
        let deleteBarButtonItem = UIBarButtonItem(customView: deleteButton)
        
        editButton.setImage(UIImage(named: "icon_edit"), for: .normal)
        let editBarButtonItem = UIBarButtonItem(customView: editButton)
        
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let emptyButtonItem = UIBarButtonItem(customView: emptyView)
        navigationItem.rightBarButtonItems = [deleteBarButtonItem, emptyButtonItem, editBarButtonItem]
    }
    
    func styleViews() {
        view.backgroundColor = .backgroundColor
        scrollView.backgroundColor = .white
        
        scrollViewContainer.backgroundColor = .clear
        firstContainer.backgroundColor = .white
        firstContainer.dropShadow()
        
        secondContainer.backgroundColor = .clear
        
        detailsLabel.textColor = .black
        detailsLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        detailsDescriptionLabel.textColor = .gray
        detailsDescriptionLabel.font = UIFont.systemFont(ofSize: 16.0)
        detailsDescriptionLabel.numberOfLines = 0
    }
    
    func defineLayoutForViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        dateView.translatesAutoresizingMaskIntoConstraints = false
        locationView.translatesAutoresizingMaskIntoConstraints = false
        firstContainer.translatesAutoresizingMaskIntoConstraints = false
        
        secondContainer.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstContainer.layer.cornerRadius = 8
        secondContainer.layer.cornerRadius = 8
        
        // UIScrollView constraints
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // firstContainer constraints
        NSLayoutConstraint.activate([
            firstContainer.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 15),
            firstContainer.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -15),
            firstContainer.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 15),
        ])
        
        // scrollStackViewContainer constraints
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: -30)
        ])
        
        // dateView constraints
        NSLayoutConstraint.activate([
            dateView.topAnchor.constraint(equalTo: firstContainer.topAnchor, constant: 10),
            dateView.leadingAnchor.constraint(equalTo: firstContainer.leadingAnchor),
            dateView.trailingAnchor.constraint(equalTo: firstContainer.trailingAnchor)
        ])
        
        // location constraints
        NSLayoutConstraint.activate([
            locationView.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 15),
            locationView.bottomAnchor.constraint(equalTo: firstContainer.bottomAnchor, constant: -10),
            locationView.leadingAnchor.constraint(equalTo: firstContainer.leadingAnchor),
            locationView.trailingAnchor.constraint(equalTo: firstContainer.trailingAnchor)
        ])
        
        // secondContainer constraints
        NSLayoutConstraint.activate([
            secondContainer.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 15),
            secondContainer.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -15),
            secondContainer.topAnchor.constraint(equalTo: firstContainer.bottomAnchor, constant: 15),
            secondContainer.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor, constant: -15),
        ])
        
        // detailsLabel constraints
        NSLayoutConstraint.activate([
            detailsLabel.leadingAnchor.constraint(equalTo: secondContainer.leadingAnchor),
            detailsLabel.trailingAnchor.constraint(equalTo: secondContainer.trailingAnchor),
            detailsLabel.topAnchor.constraint(equalTo: secondContainer.topAnchor, constant: 10),
        ])
        
        // detailsLabel constraints
        NSLayoutConstraint.activate([
            detailsDescriptionLabel.leadingAnchor.constraint(equalTo: secondContainer.leadingAnchor),
            detailsDescriptionLabel.trailingAnchor.constraint(equalTo: secondContainer.trailingAnchor),
            detailsDescriptionLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 5),
            detailsDescriptionLabel.bottomAnchor.constraint(equalTo: secondContainer.bottomAnchor, constant: -10)
        ])
        
    }
    
}
