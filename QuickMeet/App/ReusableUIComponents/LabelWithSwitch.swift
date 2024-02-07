//
//  LabelWithSwitch.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 07.02.2024..
//

import UIKit

class LabelWithSwitch: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20.0)
        return label
    }()

    let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = .itemColor
        switchControl.tintColor = .gray
        switchControl.layer.cornerRadius = switchControl.frame.height / 2.0
        switchControl.backgroundColor = .gray.withAlphaComponent(0.6)
        switchControl.clipsToBounds = true
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
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
        addSubview(label)
        addSubview(switchControl)
        addSubview(bottomBorder)
        translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints for the label
        
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchControl.centerYAnchor).isActive = true
        
        // Constraints for the datePicker
        switchControl.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        switchControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        switchControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
