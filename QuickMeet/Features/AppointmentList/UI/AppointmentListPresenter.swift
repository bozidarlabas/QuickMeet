//
//  AppointmentListPresenter.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation

class AppointmentListPresenter {
    
    private weak var coordinator: MainCoordinatorProtocol?
    
    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func addAppointmentButtonSelected() {
        coordinator?.presentCreateAppointmentScreen()
    }
}
