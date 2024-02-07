//
//  NotificationManager.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 07.02.2024..
//

import UserNotifications
import Foundation


class NotificationManager {
    
    func askNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }
    
    func addNotification(appointment: AppointmentItemModel) {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                guard let triggerDate = appointment.dateAndTime else { return }
                let dateMinus30Minutes = triggerDate.addingTimeInterval(-30 * 60)

                let content = UNMutableNotificationContent()
                content.title = "Your appointment is in 30 minutes."
                content.body = "\("title_location".localized): \(appointment.location) | \("title_description".localized): \(appointment.details)"
                content.sound = UNNotificationSound.default
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dateMinus30Minutes), repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    } else {
                        print("Notification scheduled successfully.")
                    }
                }
            } else {
                print("Permission not granted for notifications.")
            }
        }
        
    }
    
}
