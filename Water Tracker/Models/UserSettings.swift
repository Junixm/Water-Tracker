//
//  UserSettings.swift
//  Water Tracker
//
//  Created by Jun on 1/8/25.
//

import Foundation
import SwiftData

@Model
class UserSettings {
    var intakeGoal: Int
    var reminderStartTime: Date
    var reminderEndTime: Date
    var quickVolumes: [Int]
    
    init(
        intakeGoal: Int = 2000,
        reminderStartTime: Date = UserSettings.defaultTime(hour: 8, minute: 0),
        reminderEndTime: Date = UserSettings.defaultTime(hour: 22, minute: 0),
        quickVolumes: [Int] = [250, 500, 750, 1000]
    ) {
        self.intakeGoal = intakeGoal
        self.reminderStartTime = reminderStartTime
        self.reminderEndTime = reminderEndTime
        self.quickVolumes = quickVolumes
    }
    
    static func defaultTime(hour: Int, minute: Int) -> Date {
        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components) ?? Date()
    }
}
