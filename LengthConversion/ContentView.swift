//
//  ContentView.swift
//  LengthConversion
//
//  Created by Matilda Mared on 2022-10-20.
//

/*
 Which units you choose are down to you, but you could choose one of these:

 Temperature conversion: users choose Celsius, Fahrenheit, or Kelvin.
 Length conversion: users choose meters, kilometers, feet, yards, or miles.
 Time conversion: users choose seconds, minutes, hours, or days.
 Volume conversion: users choose milliliters, liters, cups, pints, or gallons.
 If you were going for length conversion you might have:

 A segmented control for meters, kilometers, feet, yard, or miles, for the input unit.
 A second segmented control for meters, kilometers, feet, yard, or miles, for the output unit.
 A text field where users enter a number.
 A text view showing the result of the conversion.
 */

import SwiftUI

struct ContentView: View {
    enum Units {
        case meters, kilometers, feet, yards, miles
    }
    
    @State private var fromUnit = "meters"
    @State private var toUnit = "feet"
    @State private var length = 0
    
    let lengthUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Length", value: $length, format: .number)
                } header: {
                    Text("Length")
                }
                
                Section {
                    Picker("From unit", selection: $fromUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Picker("To unit", selection: $toUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
            }.navigationTitle("Length conversion")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
