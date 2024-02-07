//
//  AppointmentCollectionViewCell.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class AppointmentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: AppointmentCollectionViewCell.self)
    
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let dateTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
        dateTimeLabel.text = appointment.formatedDateTime
        locationLabel.text = appointment.location
    }
}
