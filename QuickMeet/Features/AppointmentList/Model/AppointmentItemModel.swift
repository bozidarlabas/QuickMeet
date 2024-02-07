//
//  AppointmentItemModel.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import Foundation

struct AppointmentItemModel {
    
    var id: UUID
    let details: String
    let date: Date
    let time: Date
    let location: String
    var saveToCalendar: Bool = false
    var addNotification: Bool = false
    
    private var dateString: String = ""
    private var timeString: String = ""
    var formatedDateTime: String { String(format: "datetime_at".localized, dateString, timeString) }
    
    var dateAndTime: Date? {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
        return calendar.date(bySettingHour: timeComponents.hour ?? 0, minute: timeComponents.minute ?? 0, second: timeComponents.second ?? 0, of: calendar.date(from: dateComponents) ?? Date())
    }
    
    init(id: UUID? = nil, details: String, date: Date, time: Date, location: String) {
        if let id = id {
            self.id = id
        } else {
            self.id = UUID()
        }
        self.details = details
        self.date = date
        self.time = time
        self.location = location
        self.dateString = getDateTimeString(format: "dd.MM.yyyy", date: date)
        self.timeString = getDateTimeString(format: "HH:mm", date: time)
    }
    
    private func getDateTimeString(format: String, date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    

    
}
