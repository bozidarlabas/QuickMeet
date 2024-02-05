//
//  AppointmentDetailsViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation
import UIKit

class AppointmentDetailsViewController: UIViewController {
    
    // Properties
    private var presenter: AppointmentDetailsPresenter!
    
    convenience init(presenter: AppointmentDetailsPresenter) {
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
