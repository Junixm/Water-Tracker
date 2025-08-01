//
//  DailyLog.swift
//  Water Tracker
//
//  Created by Jun on 1/8/25.
//

import Foundation
import SwiftData

@Model
class DailyLog {
    var date: Date
    var totalIntake: Int
    @Relationship(deleteRule: .cascade)
    var beverageEntries: [BeverageEntry]
    
    init(date: Date = Calendar.current.startOfDay(for: .now), totalIntake: Int = 0, beverageEntries: [BeverageEntry] = []) {
        self.date = date
        self.totalIntake = totalIntake
        self.beverageEntries = beverageEntries
    }
}
