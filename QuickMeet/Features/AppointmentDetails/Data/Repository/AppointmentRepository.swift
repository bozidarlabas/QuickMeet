//
//  AppointmentRepository.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import Foundation
import Combine

class AppointmentRepository: AppointmentRepositoryProtocol {
    
    private var coreData: CoreDataStack
    
    var appointmentsPublisher: AnyPublisher<[AppointmentItemModel], Never> {
        coreData.appointmentsPublisher.map { items in
            guard let items = items else {
                return []
            }
            return items.map { AppointmentItemModel(id: $0.id, details: $0.details, date: $0.date, time: $0.time, location: $0.location) }
        }.eraseToAnyPublisher()
    }
    
    var editedAppointmentPublisher: AnyPublisher<AppointmentItemModel?, Never> {
        coreData.editedAppointmentPublisher.map { item in
            guard let item = item else {
                return nil
            }
            return AppointmentItemModel(id: item.id, details: item.details, date: item.date, time: item.time, location: item.location)
        }.eraseToAnyPublisher()
    }
    
    init(coreData: CoreDataStack) {
        self.coreData = coreData
    }
    
    func saveAppointment(_ model: AppointmentItemModel) {
        coreData.saveAppointment(model)
    }
    
    func deleteAppointment(withId itemId: UUID) {
        coreData.deleteAppointment(withId: itemId)
    }
    
    func editAppointment(_ model: AppointmentItemModel) {
        coreData.editAppointment(model)
    }
    
    func observeChanges() {
        coreData.observeChanges()
    }
    
}
