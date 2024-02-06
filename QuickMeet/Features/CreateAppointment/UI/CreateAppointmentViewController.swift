//
//  CreateAppointmentViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit
import Combine

class CreateAppointmentViewController: UIViewController {
    
    // Properties
    private var presenter: CreateAppointmentPresenter!
    private var cancellables = Set<AnyCancellable>()
    var menuChildren: [UIMenuElement] = []
    
    // Views
    var backButton = UIButton()
    var stackview = UIStackView()
    var dateView = CustomDateView()
    var timeView = CustomDateView()
    var locationLabel = UILabel()
    var locationDropdownView = LabelWithDropdown()
    var locationDropdownButton: UIButton { locationDropdownView.button }
    var descriptionTextView = MultilineTextField()
    var saveButton = UIButton()
    
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
        backButton
            .publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.dismiss(animated: true)
            }.store(in: &cancellables)
    }
    
    private func setup() {
        for fruit in presenter.locations {
            menuChildren.append(UIAction(title: fruit, handler: actionClosure))
        }
    }
    
}
