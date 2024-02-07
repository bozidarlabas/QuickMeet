//
//  MainCoordinator.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit
import Hero

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
        let presenter = AppointmentListPresenter(coordinator: self, repository: appDependencies.appointmentRepository)
        let viewController = AppointmentListViewController(presenter: presenter)
        navigation.pushViewController(viewController, animated: true)
    }
    
    func presentCreateAppointmentScreen(selectedModel: AppointmentItemModel?) {
        let presenter = CreateAppointmentPresenter(
            repository: appDependencies.appointmentRepository,
            selectedAppointment: selectedModel,
            appleCalendar: appDependencies.appleCalendar, 
            notificationManager: appDependencies.notificationManager)
        let viewController = CreateAppointmentViewController(presenter: presenter)
        if let delegate = navigation.topViewController as? UIViewControllerTransitioningDelegate {
            viewController.transitioningDelegate = delegate
        }
        viewController.modalPresentationStyle = .custom
        navigation.present(viewController, animated: true)
    }
    
    func presentAppointmentDetailsScreen(selectedModel: AppointmentItemModel) {
        let presenter = AppointmentDetailsPresenter(
            coordinator: self,
            selectedModel: selectedModel,
            repository: appDependencies.appointmentRepository)
        let viewController = AppointmentDetailsViewController(presenter: presenter)
        viewController.hero.isEnabled = true
        viewController.firstContainer.hero.id = "\(AnimationConstants.listToDetailsKey) \(selectedModel.id)"
        navigation.hero.isEnabled = true
        Hero.shared.defaultAnimation = .fade
        navigation.pushViewController(viewController, animated: true)
    }
    
    private func presentInWindow() {
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
