//
//  CreateAppointmentViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation
import UIKit

class CreateAppointmentViewController: UIViewController {
    
    // Properties
    private var presenter: CreateAppointmentPresenter!
    
    convenience init(presenter: CreateAppointmentPresenter) {
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
