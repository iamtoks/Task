//
//  DateHelpers.swift
//  Task
//
//  Created by adetokunbo babatunde on 6/11/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
     
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
