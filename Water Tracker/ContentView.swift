//
//  ContentView.swift
//  Water Tracker
//
//  Created by Jun on 30/7/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Text("Coming Soon")
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Stats")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
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
    
    return ContentView().modelContainer(container)
}
