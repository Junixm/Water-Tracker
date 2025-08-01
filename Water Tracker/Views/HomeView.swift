//
//  HomeView.swift
//  Water Tracker
//
//  Created by Jun on 30/7/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Title
                Text("Hydrate")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding([.horizontal, .bottom])
                    .background(Color.blue.opacity(0.8))
                
                // Circular progress with total intake
                ZStack {
                    Circle()
                        .stroke(Color.blue.opacity(0.2), lineWidth: 20)
                        .frame(width: 200, height: 200)
                    
                    Circle()
                        .trim(from: 0.0, to: 0.0)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth:20, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 200, height: 200)
                    
                    VStack {
                        Text("0")
                            .font(.title)
                            .bold()
                        Text("ml")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("of 2000 ml")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                // Percentage goal
                HStack{
                    //goal image
                    Image(systemName: "target")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                    Text("0% of daily goal")
                        .font(.headline)
                }
                
                // Quick buttons
                HStack() {
                    Spacer()
                    BeverageButton(name: "Water", systemImage: "drop", foregroundColor: .blue)
                    Spacer()
                    BeverageButton(name: "Tea", systemImage: "cup.and.saucer", foregroundColor: .green)
                    Spacer()
                    BeverageButton(name: "Coffee", systemImage: "mug", foregroundColor: .brown)
                    Spacer()
                }

                // Today's Log
                Text("Today's Log")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                VStack(spacing: 10) {
                    Text("No logs yet.")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
        }
    }
}

struct BeverageButton: View {
    let name: String
    let systemImage: String
    let foregroundColor: Color
    
    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(foregroundColor)
            Text(name)
                .font(.caption)
        }
        .frame(width: 100, height: 80)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    HomeView()
}
