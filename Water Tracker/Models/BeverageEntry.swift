//
//  BeverageEntry.swift
//  Water Tracker
//
//  Created by Jun on 1/8/25.
//

import Foundation
import SwiftData

enum BeverageType: String, Codable, CaseIterable {
    case water = "Water"
    case tea = "Tea"
    case coffee = "Coffee"
}

@Model
class BeverageEntry {
    var type: BeverageType
    var volume: Int
    var timestamp: Date
    
    init(type: BeverageType, volume: Int, timestamp: Date = .now) {
        self.type = type
        self.volume = volume
        self.timestamp = timestamp
    }
}
