//
//  MainCoordinator.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit

class MainCoordinator: MainCoordinatorProtocol {
    
    private var window: UIWindow
    private var navigation: UINavigationController = {
       let navigation = UINavigationController()
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigation.navigationBar.barTintColor = .secondaryColor
        return navigation
    }()
    private var appDependencies = AppDependencies()
    
    init(window: UIWindow) {
        self.window = window
        presentInWindow()
    }
    
    func start() {
        presentAppointmentListScreen()
    }
    
    func presentAppointmentListScreen() {
        let presenter = AppointmentListPresenter(coordinator: self)
        let viewController = AppointmentListViewController(presenter: presenter)
        navigation.pushViewController(viewController, animated: true)
    }
    
    func presentCreateAppointmentScreen() {
        let presenter = CreateAppointmentPresenter()
        let viewController = CreateAppointmentViewController(presenter: presenter)
        if let delegate = navigation.topViewController as? UIViewControllerTransitioningDelegate {
            viewController.transitioningDelegate = delegate
        }
        viewController.modalPresentationStyle = .custom
        navigation.present(viewController, animated: true)
    }
    
    private func presentInWindow() {
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
