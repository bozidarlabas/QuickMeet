//
//  CreateAppointmentPresenter.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import Foundation

class CreateAppointmentPresenter {
    
    let locations = ["San Diego", "St. George", "Park City", "Dallas", "Memphis", "Orlando"]
    private var repository: AppointmentRepositoryProtocol
    var selectedAppointment: AppointmentItemModel?
    var isEditMode: Bool { selectedAppointment != nil }
    var selectedLocationIndex: Int? {
        guard let selectedAppointment = selectedAppointment else { return nil }
        return locations.firstIndex(of: selectedAppointment.location)
    }
    private var appleCalendar: AppleCalendar
    private var notificationManager: NotificationManager
    
    init(
        repository: AppointmentRepositoryProtocol,
        selectedAppointment: AppointmentItemModel?,
        appleCalendar: AppleCalendar,
        notificationManager: NotificationManager
    ) {
        self.repository = repository
        self.selectedAppointment = selectedAppointment
        self.appleCalendar = appleCalendar
        self.notificationManager = notificationManager
    }
    
    func saveAppointment(appointmentModel: AppointmentItemModel) {
        if appointmentModel.saveToCalendar {
            saveToAppleCalendar(appointmentModel: appointmentModel)
        }
        
        if appointmentModel.addNotification {
            createNotification(appointmentModel: appointmentModel)
        }
        repository.saveAppointment(appointmentModel)
    }
    
    func editAppointment(updatedModel: AppointmentItemModel) {
        repository.editAppointment(updatedModel)
    }
    
    func saveToAppleCalendar(appointmentModel: AppointmentItemModel) {
        appleCalendar.addEventToCalendar(date: appointmentModel.date, description: appointmentModel.details, location: appointmentModel.location)
    }
    
    func createNotification(appointmentModel: AppointmentItemModel) {
        notificationManager.addNotification(appointment: appointmentModel)
    }
    
    func askCalendarPermission() {
        appleCalendar.askCalendarPermission()
    }
    
    func askNotificationPermission() {
        notificationManager.askNotificationPermission()
    }
    
}
