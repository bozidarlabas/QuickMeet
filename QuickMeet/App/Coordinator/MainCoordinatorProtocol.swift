//
//  MainCoordinatorProtocol.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation

protocol MainCoordinatorProtocol: AnyObject {
    
    func presentAppointmentListScreen()
    
    func presentCreateAppointmentScreen(selectedModel: AppointmentItemModel?)
    
    func presentAppointmentDetailsScreen(selectedModel: AppointmentItemModel)
    
}
