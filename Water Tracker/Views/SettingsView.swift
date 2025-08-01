//
//  SettingsView.swift
//  Water Tracker
//
//  Created by Jun on 1/8/25.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Query var settings: [UserSettings]
    @Environment(\.modelContext) private var context
    
    @State private var intakeGoal: Int = 404
    @State private var reminderStart: Date = UserSettings.defaultTime(hour: 0, minute: 0)
    @State private var reminderEnd: Date = UserSettings.defaultTime(hour: 23,minute: 59)
    @State private var quickVolume1: Int = 1
    @State private var quickVolume2: Int = 2
    @State private var quickVolume3: Int = 3
    @State private var quickVolume4: Int = 4
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Daily Intake Goal")) {
                    SliderView(targetName: "Goal", target: $intakeGoal, minValue: 100, maxValue: 10000, step: 10)
                }
                
                /*
                Section(header: Text("Reminder Time")) {
                    DatePicker("Start", selection: $reminderStart, displayedComponents: .hourAndMinute)
                    DatePicker("End", selection: $reminderEnd, displayedComponents: .hourAndMinute)
                }
                */
                
                /*
                Section(header: Text("Quick Volumes")) {
                    let min: Int = 10
                    let max: Int = 1000
                    let step: Int = 10
                    SliderView(targetName: "Volume 1", target: $quickVolume1, minValue: min, maxValue: max, step: step)
                    SliderView(targetName: "Volume 2", target: $quickVolume2, minValue: min, maxValue: max, step: step)
                    SliderView(targetName: "Volume 3", target: $quickVolume3, minValue: min, maxValue: max, step: step)
                    SliderView(targetName: "Volume 4", target: $quickVolume4, minValue: min, maxValue: max, step: step)
                }
                */
                
                Button("Save Settings") {
                    saveSettings()
                }
                
                Button("Reset to Default") {
                    resetToDeafult()
                }
                .foregroundColor(.red)
            }
            .navigationTitle("Settings")
            .onAppear {
                loadSettings()
            }
        }
    }
    
    private func resetToDeafult() {
        let defaultSettings = UserSettings()
        
        intakeGoal = defaultSettings.intakeGoal
        reminderStart = defaultSettings.reminderStartTime
        reminderEnd = defaultSettings.reminderEndTime
        quickVolume1 = defaultSettings.quickVolumes[0]
        quickVolume2 = defaultSettings.quickVolumes[1]
        quickVolume3 = defaultSettings.quickVolumes[2]
        quickVolume4 = defaultSettings.quickVolumes[3]
    }
    
    private func loadSettings() {
        guard let userSettings = settings.first else { return }
        intakeGoal = userSettings.intakeGoal
        reminderStart = userSettings.reminderStartTime
        reminderEnd = userSettings.reminderEndTime
        
        if userSettings.quickVolumes.count >= 4 {
            quickVolume1 = userSettings.quickVolumes[0]
            quickVolume2 = userSettings.quickVolumes[1]
            quickVolume3 = userSettings.quickVolumes[2]
            quickVolume4 = userSettings.quickVolumes[3]
        }
    }
    
    private func saveSettings() {
        var userSettings = settings.first
        
        if userSettings == nil {
            userSettings = UserSettings()
            context.insert(userSettings!)
        }
        
        userSettings?.intakeGoal = intakeGoal
        userSettings?.reminderStartTime = reminderStart
        userSettings?.reminderEndTime = reminderEnd
        userSettings?.quickVolumes = [quickVolume1, quickVolume2, quickVolume3, quickVolume4]
        
        do {
            try context.save()
        } catch {
            print("Error saving settings: \(error)")
        }
    }
}

#Preview {
    let container = try! ModelContainer(
        for: UserSettings.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    let settings = UserSettings()
    container.mainContext.insert(settings)
    
    return SettingsView().modelContainer(container)
}
