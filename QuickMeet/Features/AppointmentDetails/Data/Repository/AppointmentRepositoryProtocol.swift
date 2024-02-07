//
//  AppointmentRepositoryProtocol.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import Foundation
import Combine

protocol AppointmentRepositoryProtocol {
    
    var appointmentsPublisher: AnyPublisher<[AppointmentItemModel], Never> { get }
    
    var editedAppointmentPublisher: AnyPublisher<AppointmentItemModel?, Never> { get }
    
    func saveAppointment(_ model: AppointmentItemModel)
    
    func deleteAppointment(withId itemId: UUID)
    
    func editAppointment(_ model: AppointmentItemModel)
    
    func observeChanges()
    
}
