//
//  Task+Conenience.swift
//  Task
//
//  Created by adetokunbo babatunde on 6/11/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import Foundation
import CoreDataStack

extension Task {
    
    @discardableResult
    convenience init(name: String, notes: String?, due: Date?, isComplete: Bool) {
        self.init(context: CoreDataStack.context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
}
