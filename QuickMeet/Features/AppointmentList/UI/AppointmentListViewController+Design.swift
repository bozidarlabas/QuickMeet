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
        view.addSubview(containerView)
        
        view.addSubview(topViewsContainer)
        topViewsContainer.addSubview(borderLine)
        topViewsContainer.addSubview(leftInfoView)
        
        topViewsContainer.addSubview(rightInfoView)
        
        
        
        containerView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AppointmentCollectionViewCell.self, forCellWithReuseIdentifier: AppointmentCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        
        collectionView.addSubview(addAppointmentButton)
        
        view.insertSubview(addAppointmentButton, aboveSubview: containerView)
        
    }
    
    func styleViews() {
        view.backgroundColor = .secondaryColor
        addAppointmentButton.backgroundColor = .secondaryColor
        addAppointmentButton.setImage(UIImage(named: "icon_plus"), for: .normal)
        addAppointmentButton.layer.zPosition = 999
        topViewsContainer.layer.zPosition = 999
        borderLine.layer.zPosition = 999
        
        containerView.backgroundColor = .backgroundColor
        containerView.layer.cornerRadius = 40
        containerView.clipsToBounds = true
        borderLine.backgroundColor = .black.withAlphaComponent(0.2)
        topViewsContainer.dropShadow()
    }
    
    func defineLayoutForViews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addAppointmentButton.translatesAutoresizingMaskIntoConstraints = false
        topViewsContainer.translatesAutoresizingMaskIntoConstraints = false
        borderLine.translatesAutoresizingMaskIntoConstraints = false
        leftInfoView.translatesAutoresizingMaskIntoConstraints = false
        rightInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topViewsContainer.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addAppointmentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            addAppointmentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            addAppointmentButton.heightAnchor.constraint(equalToConstant: 50),
            addAppointmentButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topViewsContainer.bottomAnchor, constant: 15),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topViewsContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            topViewsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            topViewsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            borderLine.leadingAnchor.constraint(equalTo: leftInfoView.trailingAnchor),
            borderLine.topAnchor.constraint(equalTo: leftInfoView.topAnchor, constant: 5),
            borderLine.bottomAnchor.constraint(equalTo: leftInfoView.bottomAnchor, constant: -5),
            borderLine.widthAnchor.constraint(equalToConstant: 1),
            
            leftInfoView.topAnchor.constraint(equalTo: topViewsContainer.topAnchor),
            leftInfoView.leadingAnchor.constraint(equalTo: topViewsContainer.leadingAnchor),
            leftInfoView.trailingAnchor.constraint(equalTo: rightInfoView.leadingAnchor),
            leftInfoView.widthAnchor.constraint(equalTo: rightInfoView.widthAnchor),
            
            rightInfoView.topAnchor.constraint(equalTo: leftInfoView.topAnchor),
            rightInfoView.bottomAnchor.constraint(equalTo: topViewsContainer.bottomAnchor),
            rightInfoView.trailingAnchor.constraint(equalTo: topViewsContainer.trailingAnchor),
        ])
    }
    
}
