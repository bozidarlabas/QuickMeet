//
//  AppointmentItem+CoreDataProperties.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//
//

import Foundation
import CoreData


extension AppointmentItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppointmentItem> {
        return NSFetchRequest<AppointmentItem>(entityName: "AppointmentItem")
    }

    @NSManaged public var details: String?
    @NSManaged public var dateTime: Date?
    @NSManaged public var location: String?

}

extension AppointmentItem : Identifiable {

}
