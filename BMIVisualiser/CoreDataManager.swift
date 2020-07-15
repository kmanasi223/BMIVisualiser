//
//  CoreDataManager.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 15/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataManager {
    static func fetchEntity<T: NSManagedObject>(_ name: String) -> [T]? {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedObjectContext = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: name)
        do {
            let result = try managedObjectContext.fetch(fetchRequest) as? [T]
            return result
        } catch {
            return nil
        }
    }
    
    static func insertIntoEntity<T: NSManagedObject>(_ name: String) -> T? {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedObjectContext = appdelegate.persistentContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: name, in: managedObjectContext)
        if entityDescription == nil {
            return nil
        }
        let row = NSManagedObject(entity: entityDescription!, insertInto: managedObjectContext) as? T
        appdelegate.saveContext()
        return row
    }
}
