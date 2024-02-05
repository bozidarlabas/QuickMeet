//
//  AppointmentListViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit
import Combine

class AppointmentListViewController: UIViewController {
    
    // Properties
    private var presenter: AppointmentListPresenter!
    private var cancellables = Set<AnyCancellable>()
    let transition = CircularTransition()
    
    // Views
    var addAppointmentButton = CircularButton()
    
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
        addAppointmentButton
            .publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.presenter.addAppointmentButtonSelected()
            }.store(in: &cancellables)
    }
}

extension AppointmentListViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = addAppointmentButton.center
        transition.circleColor = addAppointmentButton.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = addAppointmentButton.center
        transition.circleColor = addAppointmentButton.backgroundColor!
        
        return transition
    }
    
}
