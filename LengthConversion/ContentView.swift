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
    @State private var length: Double = 0
    
    var result: Double {
        switch fromUnit {
        case "meters":
            if toUnit == "kilometers" {
                return length / 1000
            } else if toUnit == "feet" {
                return length * 3.28084
            } else if toUnit == "yards" {
                return length * 1.0936
            } else if toUnit == "miles" {
                return length * 0.00062137
            } else {
                return length
            }
        case "kilometers":
            if toUnit == "meters" {
                return length * 1000
            } else if toUnit == "feet" {
                return length * 3280.84
            } else if toUnit == "yards" {
                return length * 1093.6133
            } else if toUnit == "miles" {
                return length * 0.621371192
            } else {
                return length
            }
        case "feet":
            if toUnit == "meters" {
                return length * 0.3048
            } else if toUnit == "yards" {
                return length / 3
            } else if toUnit == "miles" {
                return length * 0.000189393939
            } else if toUnit == "kilometers" {
                return length * 0.0003048
            } else {
                return length
            }
        case "yards":
            if toUnit == "meters" {
                return length * 0.9144
            } else if toUnit == "miles" {
                return length * 0.000568181818
            } else if toUnit == "kilometers" {
                return length * 0.0009144
            } else if toUnit == "feet" {
                return length * 3
            } else {
                return length
            }
        case "miles":
            if toUnit == "yards" {
                return length * 1760
            } else if toUnit == "meters" {
                return length * 1609.344
            } else if toUnit == "kilometers" {
                return length * 1.609344
            } else if toUnit == "feet" {
                return length * 5280
            } else {
                return length
            }
        default:
            return length
        }
    }
    
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
                
                Section {
                    Text("\(result, specifier: "%.2f")")
                } header: {
                    Text("\(length, specifier: "%.2f") \(fromUnit) in \(toUnit) is")
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
