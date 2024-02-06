//
//  AppointmentListPresenter.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation

class AppointmentListPresenter {
    
    private weak var coordinator: MainCoordinatorProtocol?
    
    let appointments: [AppointmentItemModel] = [
        AppointmentItemModel(details: "Meeting with Client A", dateTime: Date(), location: "Office 123"),
        AppointmentItemModel(details: "Conference Call", dateTime: Date(timeIntervalSinceNow: 3600), location: "Virtual"),
        AppointmentItemModel(details: "Lunch with Team", dateTime: Date(timeIntervalSinceNow: 7200), location: "Cafeteria"),
        AppointmentItemModel(details: "Meeting with Client A", dateTime: Date(), location: "Office 123"),
        AppointmentItemModel(details: "Conference Call", dateTime: Date(timeIntervalSinceNow: 3600), location: "Virtual"),
        AppointmentItemModel(details: "Lunch with Team", dateTime: Date(timeIntervalSinceNow: 7200), location: "Cafeteria"),
        AppointmentItemModel(details: "Meeting with Client A", dateTime: Date(), location: "Office 123"),
        AppointmentItemModel(details: "Conference Call", dateTime: Date(timeIntervalSinceNow: 3600), location: "Virtual"),
        AppointmentItemModel(details: "Lunch with Team", dateTime: Date(timeIntervalSinceNow: 7200), location: "Cafeteria"),
    ]
    
    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func addAppointmentButtonSelected() {
        coordinator?.presentCreateAppointmentScreen()
    }
}
