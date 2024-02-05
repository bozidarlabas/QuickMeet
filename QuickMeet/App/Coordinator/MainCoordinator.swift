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
        
    }
    
    private func presentInWindow() {
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
