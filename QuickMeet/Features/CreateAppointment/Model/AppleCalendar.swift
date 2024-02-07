//
//  AppleCalendar.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 07.02.2024..
//

import EventKit

class AppleCalendar {
    
    let eventStore = EKEventStore()
    
    func askCalendarPermission() {
        eventStore.requestAccess(to: .event, completion: {[weak self] (granted: Bool, error: Error?) -> Void in })
    }

    func addEventToCalendar(date: Date, description: String, location: String) {

        // Check for calendar access permission
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            createEvent(eventStore: eventStore, date: date, description: description, location: location)
        case .denied:
            print("Access denied to the calendar. Please grant permission in settings.")
        case .notDetermined:
            eventStore.requestAccess(to: .event, completion:
                {[weak self] (granted: Bool, error: Error?) -> Void in
                guard let self = self else { return }
                    if granted {
                        self.createEvent(eventStore: eventStore, date: date, description: description, location: location)
                    } else {
                        print("Access denied to the calendar. Please grant permission in settings.")
                    }
            })
        default: break
        }
    }

    func createEvent(eventStore: EKEventStore, date: Date, description: String, location: String) {
        let event = EKEvent(eventStore: eventStore)
        event.title = "QuickMeet Appointment"
        event.startDate = date
        event.endDate = date.addingTimeInterval(1 * 60 * 60)
        event.notes = description
        event.location = location

        // You can set additional properties like location, alarms, etc.

        event.calendar = eventStore.defaultCalendarForNewEvents

        do {
            try eventStore.save(event, span: .thisEvent)
        } catch {
            print("Error saving event to calendar: \(error)")
        }
    }

    
}
