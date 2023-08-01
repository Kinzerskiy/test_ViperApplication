//
//  CoreDataManager.swift
//  ios_test_app
//
//  Created by Mac Pro on 24.07.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Persons")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchPersons() -> [Persons] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Persons> = Persons.fetchRequest()
        do {
            let persons = try context.fetch(fetchRequest)
            return persons
        } catch {
            print("Failed to fetch persons from Core Data: \(error)")
            return []
        }
    }
    
    func createPerson(fullName: String, city: String, info: String, birthday: String) {
        let context = persistentContainer.viewContext
        let entityName = "Persons"
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            print("Failed to create \(entityName) entity.")
            return
        }
        
        let person = NSManagedObject(entity: entity, insertInto: context)
        person.setValue(fullName, forKey: "userName")
        person.setValue(city, forKey: "city")
        person.setValue(info, forKey: "info")
        person.setValue(birthday, forKey: "birthday")
        
        saveContext()
    }
}
