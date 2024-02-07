//
//  AppointmentListPresenter.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation
import Combine

class AppointmentListPresenter {
    
    private weak var coordinator: MainCoordinatorProtocol?
    private var repository: AppointmentRepositoryProtocol
    var appointments: [AppointmentItemModel] = []
    
    
    var numberOfTodayAppointments: Int {
        let currentDate = Calendar.current.startOfDay(for: Date())
        return appointments.filter { appointment in
            let appointmentDate = Calendar.current.startOfDay(for: appointment.date)
            return appointmentDate == currentDate
        }.count
    }
    
    var numberOfUpcomingAppointments: Int {
        let currentDate = Calendar.current.startOfDay(for: Date())
        
        return appointments.filter { appointment in
            let appointmentDate = Calendar.current.startOfDay(for: appointment.date)
            return appointmentDate >= currentDate
        }.count
    }
    
    var appointmentsPublisher: AnyPublisher<[AppointmentItemModel], Never> {
        repository
            .appointmentsPublisher
            .handleEvents(receiveOutput: { [weak self] appointmentItemModels in
                guard let self = self else { return }
                appointments = appointmentItemModels.sorted(by: sortByDateTime)
            })
            .eraseToAnyPublisher()
    }
    
    init(
        coordinator: MainCoordinatorProtocol,
        repository: AppointmentRepositoryProtocol
    ) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    func addAppointmentButtonSelected() {
        coordinator?.presentCreateAppointmentScreen(selectedModel: nil)
    }
    
    func appointmentItemSelected(selectedModel: AppointmentItemModel) {
        coordinator?.presentAppointmentDetailsScreen(selectedModel: selectedModel)
    }
    
    func startObserving() {
        repository.observeChanges()
    }
    
    let sortByDateTime: (AppointmentItemModel, AppointmentItemModel) -> Bool = { model1, model2 in
        let dateTime1 = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: model1.date)?.addingTimeInterval(model1.time.timeIntervalSinceReferenceDate) ?? Date()
        let dateTime2 = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: model2.date)?.addingTimeInterval(model2.time.timeIntervalSinceReferenceDate) ?? Date()

        return dateTime1 < dateTime2
    }
}
