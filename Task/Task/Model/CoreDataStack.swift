//
//  CoreDataStack.swift
//  Task
//
//  Created by adetokunbo babatunde on 6/11/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    static let container: NSPersistentContainer = {
       // let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
      let container = NSPersistentContainer(name: "Task")
        container.loadPersistentStores() { (_, error) in
            if let error = error {
                fatalError("\(error.localizedDescription)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext }
}
