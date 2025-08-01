//
//  SliderView.swift
//  Water Tracker
//
//  Created by Jun on 2/8/25.
//

import SwiftUI

struct SliderView: View {
    var targetName: String
    @Binding var target: Int
    
    var minValue: Int
    var maxValue: Int
    var step: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text("\(targetName): \(target) ml")
                    .font(.headline)
                
                Spacer()
                
                Stepper("", value: $target, in: minValue...maxValue, step: step)
                                    .labelsHidden()
            }
                
            Slider(
                value: Binding(
                    get: { Double(target) },
                    set: { target = Int($0) - Int($0) % step } // snap to 10ml
                ),
                in: Double(minValue)...Double(maxValue),
                step: Double(step)
            )
            
        }
    }
}
