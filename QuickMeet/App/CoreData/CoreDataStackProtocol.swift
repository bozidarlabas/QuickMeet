//
//  CoreDataStackProtocol.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import Foundation
import Combine

protocol CoreDataStackProtocol {
    
    var appointmentsPublisher: AnyPublisher<[AppointmentItem]?, Never> { get }
    
    var editedAppointmentPublisher: AnyPublisher<AppointmentItem?, Never> { get }
    
    func saveAppointment(_ model: AppointmentItemModel)
    
    func deleteAppointment(withId itemId: UUID)
    
    func editAppointment(_ model: AppointmentItemModel)
    
    func observeChanges()
    
}
