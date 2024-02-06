//
//  HomeInfoView.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class HomeInfoView: UIView {

    // UI components
//    private let iconImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "icon_deadline")
//        return imageView
//    }()

    private let label1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Today"
        return label
    }()

    private let label2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.text = "0 Appointments"
        return label
    }()

    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    // Setup UI components and constraints
    private func setupViews() {
//        addSubview(iconImageView)
        addSubview(label1)
        addSubview(label2)
        
        backgroundColor = .white

//        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false

        // Center the icon horizontally
        NSLayoutConstraint.activate([
//            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//            iconImageView.widthAnchor.constraint(equalToConstant: 50), // Set your desired width
//            iconImageView.heightAnchor.constraint(equalToConstant: 50) // Set your desired height
        ])

        // Center label1 horizontally below the icon
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: centerXAnchor),
            label1.topAnchor.constraint(equalTo: topAnchor, constant: 8) // Set your desired spacing
        ])

        // Center label2 horizontally below label1
        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 8),
            label2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}

