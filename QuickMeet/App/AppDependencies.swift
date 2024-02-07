//
//  AppDependencies.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation

class AppDependencies {
    
    var coreDataStack: CoreDataStack!
    var appointmentRepository: AppointmentRepositoryProtocol!
    var appleCalendar: AppleCalendar!
    var notificationManager: NotificationManager!
    
    init() {
        registerDependencies()
    }
    
    private func registerDependencies() {
        coreDataStack = CoreDataStack()
        appointmentRepository = AppointmentRepository(coreData: coreDataStack)
        appleCalendar = AppleCalendar()
        notificationManager = NotificationManager()
    }
    
}
