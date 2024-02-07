//
//  BorderLineView.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import UIKit

class BorderLineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override func didMoveToSuperview() {
        defineLayoutForViews()
    }

    private func setupUI() {
        backgroundColor = UIColor.white.withAlphaComponent(0.2)
    }
    
    func defineLayoutForViews() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 1.0).isActive = true
    }
}
