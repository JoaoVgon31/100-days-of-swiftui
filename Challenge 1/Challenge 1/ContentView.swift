//
//  ContentView.swift
//  Challenge 1
//
//  Created by João Vitor Gonçalves Oliveira on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var sourceIsFocused: Bool
    @State private var sourceUnit = "Meter"
    @State private var outputUnit = "Kilometer"
    @State private var sourceValue = 0.0
    let units = ["Meter", "Kilometer", "Feet", "Yard", "Miles"]
    let unitsConversionToMiles = [1609.34, 1.60934, 5280, 1760, 1]
    var outputValue: Double {
        let sourceSelectionIndex = units.firstIndex(where: { unit in
            unit == sourceUnit
        })
        let outputSelectionIndex = units.firstIndex(where: { unit in
            unit == outputUnit
        })
        let sourceSelectionConversion = unitsConversionToMiles[sourceSelectionIndex!]
        let outputSelectionConversion = unitsConversionToMiles[outputSelectionIndex!]
        let sourceValueInMiles = sourceValue / sourceSelectionConversion
        let outputValueFromMiles = sourceValueInMiles * outputSelectionConversion
        return outputValueFromMiles
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Source unit", selection: $sourceUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                        .pickerStyle(.segmented)
                        .keyboardType(.decimalPad)
                        .focused($sourceIsFocused)
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                        .pickerStyle(.segmented)
                        .keyboardType(.decimalPad)
                }
                Section {
                    TextField("Source", value: $sourceValue, format: .number)
                } header: {
                    Text("Source")
                }
                Section {
                    Text(outputValue, format: .number)
                } header: {
                    Text("Output")
                }
            }
                .navigationTitle("Length Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            sourceIsFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
