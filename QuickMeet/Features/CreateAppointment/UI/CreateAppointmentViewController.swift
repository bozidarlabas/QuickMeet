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
    var menuChildren: [UIMenuElement] = []
    
    // Views
    var dateLabel = UILabel()
    var dateTimePicker = UIDatePicker()
    var button = UIButton()
    
    let actionClosure = { (action: UIAction) in
        print(action.title)
    }
    
    convenience init(presenter: CreateAppointmentPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        buildViews()
        bindUI()
    }
    
    private func bindUI() {
    }
    
    private func setup() {
        for fruit in presenter.locations {
            menuChildren.append(UIAction(title: fruit, handler: actionClosure))
        }
    }
    
}
