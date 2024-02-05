//
//  MainCoordinator.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit

class MainCoordinator: MainCoordinatorProtocol {
    
    private var window: UIWindow
    private var navigation: UINavigationController = UINavigationController()
    private var appDependencies = AppDependencies()
    
    init(window: UIWindow) {
        self.window = window
        presentInWindow()
    }
    
    func start() {
        presentAppointmentListScreen()
    }
    
    func presentAppointmentListScreen() {
        let presenter = AppointmentListPresenter()
        let viewController = AppointmentListViewController(presenter: presenter)
        navigation.pushViewController(viewController, animated: true)
    }
    
    func presentAppointmenDetailstScreen() {
        let presenter = AppointmentDetailsPresenter()
        let viewController = AppointmentDetailsViewController(presenter: presenter)
        navigation.pushViewController(viewController, animated: true)
    }
    
    private func presentInWindow() {
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
