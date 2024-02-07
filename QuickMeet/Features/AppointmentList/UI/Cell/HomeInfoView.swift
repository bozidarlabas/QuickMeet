//
//  HomeInfoView.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class HomeInfoView: UIView {

    let label1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    let label2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
//        addSubview(iconImageView)
        addSubview(label1)
        addSubview(label2)
        
        backgroundColor = .white

        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: centerXAnchor),
            label1.topAnchor.constraint(equalTo: topAnchor, constant: 8) // Set your desired spacing
        ])

        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 8),
            label2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}

