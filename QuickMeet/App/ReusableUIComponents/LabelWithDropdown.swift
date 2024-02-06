//
//  LabelWithDropdown.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class LabelWithDropdown: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20.0)
        return label
    }()

    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_dropdown"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(button)
        addSubview(bottomBorder)
        translatesAutoresizingMaskIntoConstraints = false
        
        // Constraint for container
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Constraints for the label
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // Constraints for the datePicker
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

