//
//  AppointmentListViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation

import UIKit

class AppointmentListViewController: UIViewController {
    
    // // Properties
    // private var presenter: Presenter!
    //
    // // Views
    //
    // convenience init(presenter: Presenter) {
    //     self.init()
    //     self.presenter = presenter
    // }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        bindUI()
    }
    
    private func bindUI() {
        //button.addTarget(self, action: #selector(buttonSelected), for: .primaryActionTriggered)
    }
    
    //@objc func buttonSelected() {}
    
}
