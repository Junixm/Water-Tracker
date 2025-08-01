//
//  Water_TrackerApp.swift
//  Water Tracker
//
//  Created by Jun on 30/7/25.
//

import SwiftUI

@main
struct Water_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [UserSettings.self])
    }
}
