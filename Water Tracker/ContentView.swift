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
            
            Text("Stats")
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Stats")
                }
            
            Text("Settings")
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
    
    container.mainContext.insert(UserSettings())
    
    return HomeView().modelContainer(container)
}
