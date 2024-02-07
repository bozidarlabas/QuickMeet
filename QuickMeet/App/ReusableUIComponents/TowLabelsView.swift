//
//  TowLabelsView.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class TwoLabelsView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20.0)
        return label
    }()

    let label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
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
        addSubview(label2)
        addSubview(bottomBorder)
        translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints for the label
        
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: label2.centerYAnchor).isActive = true
        
        // Constraints for the datePicker
        label2.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        label2.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
