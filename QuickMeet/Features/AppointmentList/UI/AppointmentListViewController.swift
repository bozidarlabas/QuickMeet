//
//  AppointmentListViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit

class AppointmentListViewController: UIViewController {
    
    // Properties
    private var presenter: AppointmentListPresenter!
    
    convenience init(presenter: AppointmentListPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        bindUI()
    }
    
    private func bindUI() {
    }
    
    
}
