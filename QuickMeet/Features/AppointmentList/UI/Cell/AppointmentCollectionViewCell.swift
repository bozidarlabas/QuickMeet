//
//  AppointmentCollectionViewCell.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class AppointmentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: AppointmentCollectionViewCell.self)

    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let dateTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(detailsLabel)
        contentView.addSubview(dateTimeLabel)
        contentView.addSubview(locationLabel)
        
        contentView.backgroundColor = .white
        
        contentView.layer.cornerRadius = 8.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        self.layer.shadowRadius = 2.0
//        self.layer.shadowOpacity = 0.5
//        self.layer.masksToBounds = false
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        dropShadow()

        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            detailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            detailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            dateTimeLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 4),
            dateTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            dateTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            locationLabel.topAnchor.constraint(equalTo: dateTimeLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with appointment: AppointmentItemModel) {
        detailsLabel.text = appointment.details
        dateTimeLabel.text = appointment.dateTime.description
        locationLabel.text = appointment.location
    }
}

//    .fill(Color.white)
//    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
