//
//  AppointmentItem+CoreDataProperties.swift
//  
//
//  Created by Bozidar Labas on 06.02.2024..
//
//

import Foundation
import CoreData


extension AppointmentItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppointmentItem> {
        return NSFetchRequest<AppointmentItem>(entityName: "AppointmentItem")
    }

    @NSManaged public var id: UUID
    @NSManaged public var date: Date
    @NSManaged public var details: String
    @NSManaged public var location: String
    @NSManaged public var time: Date

}
