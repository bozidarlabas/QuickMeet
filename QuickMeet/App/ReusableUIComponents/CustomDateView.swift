//
//  CustomDateView.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class CustomDateView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20.0)
        return label
    }()
    
    // Date picker tint color is not customizable
    private let datePickerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.layer.cornerRadius = 4
        datePicker.clipsToBounds = true
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    let bottomBorder: BorderLineView = {
        let border = BorderLineView()
        border.translatesAutoresizingMaskIntoConstraints = false
        return border
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override func didMoveToSuperview() {
        setupUI()
    }
    
    private func setupUI() {
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        addSubview(label)
        addSubview(datePicker)
        addSubview(datePickerLabel)
        addSubview(bottomBorder)
        translatesAutoresizingMaskIntoConstraints = false
        
        datePicker.backgroundColor = .itemColor
        datePickerLabel.textAlignment = .center
        updateDatePickerLabelValue()
        
        // Constraint for container
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        datePickerLabel.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor).isActive = true
        datePickerLabel.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor).isActive = true
        datePickerLabel.bottomAnchor.constraint(equalTo: datePicker.bottomAnchor).isActive = true
        datePickerLabel.topAnchor.constraint(equalTo: datePicker.topAnchor).isActive = true
        
        // Constraints for the label
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // Constraints for the datePicker
        datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func setPickerMode(_ mode: UIDatePicker.Mode) {
        datePicker.datePickerMode = mode
        updateDatePickerLabelValue()
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDatePickerLabelValue()
    }
    
    private func updateDatePickerLabelValue() {
        let dateFormatter = DateFormatter()
        if datePicker.datePickerMode == .date {
            dateFormatter.dateFormat = "dd.MM.yyyy."
        } else if datePicker.datePickerMode == .time {
            dateFormatter.dateFormat = "HH:mm"
        }
        
        let dateString = dateFormatter.string(from: datePicker.date)
        datePickerLabel.text = dateString
    }
}

