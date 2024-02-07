//
//  CoreDataStack.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import CoreData
import Combine

class CoreDataStack: CoreDataStackProtocol {
    
    private let appointmentsChangedSubject = PassthroughSubject<[AppointmentItem]?, Never>()
    var appointmentsPublisher: AnyPublisher<[AppointmentItem]?, Never> {
        appointmentsChangedSubject.eraseToAnyPublisher()
    }
    
    private let appointmentsEditedSubject = PassthroughSubject<AppointmentItem?, Never>()
    var editedAppointmentPublisher: AnyPublisher<AppointmentItem?, Never> {
        appointmentsEditedSubject.eraseToAnyPublisher()
    }

    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "QuickMeet")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                observeChanges()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveAppointment(_ model: AppointmentItemModel) {
        let item = AppointmentItem(context: context)
        item.id = model.id
        item.details = model.details
        item.date = model.date
        item.time = model.time
        item.location = model.location

        do {
            try context.save()
            observeChanges()
        } catch {
            print("Handle save appointment error")
        }
    }
    
    func editAppointment(_ model: AppointmentItemModel) {
        guard let item = getAppointment(itemId: model.id) else { return }
        item.id = model.id
        item.details = model.details
        item.date = model.date
        item.time = model.time
        item.location = model.location

        do {
            try context.save()
            observeChanges(forItemWithId: model.id)
            observeChanges()
        } catch {
            print("Handle edit appointment error")
        }
    }
    
    func deleteAppointment(withId itemId: UUID) {
        let fetchRequest: NSFetchRequest<AppointmentItem> = AppointmentItem.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", itemId as CVarArg)

        do {
            if let appointmentItem = try context.fetch(fetchRequest).first {
                context.delete(appointmentItem)
                try context.save()
                observeChanges()
            }
        } catch {
            print("Error deleting appointment item: \(error)")
        }
    }
    
    func getAppointment(itemId: UUID) -> AppointmentItem? {
        let fetchRequest: NSFetchRequest<AppointmentItem> = AppointmentItem.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", itemId as CVarArg)

        do {
            return try context.fetch(fetchRequest).first
        } catch {
            print("Error fetching appointment: \(error)")
            return nil
        }
    }
    
    func getAppointments() -> [AppointmentItem]? {
        do {
            return try context.fetch(AppointmentItem.fetchRequest())
        } catch {
            print("Error fetching appointments: \(error)")
            return nil
        }
    }
    
    func observeChanges() {
        appointmentsChangedSubject.send(getAppointments())
    }
    
    func observeChanges(forItemWithId itemId: UUID) {
        let appointment = getAppointment(itemId: itemId)
        appointmentsEditedSubject.send(appointment)
    }
    
    
}

