//
//  BenzoConversion.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/25/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct BenzoConversion: View {
    @State private var input_dose: String = ""
    @State private var output_dose: String = ""
    @State private var input_med: String = ""
    @State private var output_med: String = ""
    
    let meds = [
        "Alprazolam",
        "Midazolam",
        "Lorazepam",
        "Clonazepam",
        "Diazepam"]
    
    func standardizeToAtivan(inM: String, inDs: String) -> Double {


        let inD = ( inDs != "" ? Double(inDs) : 0.0 )

            switch inM {
                case ("Alprazolam"):
                    let xanax_out = (inD! * 2)
                    return xanax_out
                case ("Midazolam"):

                    return inD!
                case ("Lorazepam"):

                    return inD!
                case ("Clonazepam"):

                    let clonazepam_out = (inD! * 2)
                    return clonazepam_out
                case ("Diazepam"):

                    let diazepam_out = (inD! / 5)
                    return diazepam_out
                default: return 0.0
            }
    }



    func convertSD_to_xanax(standardized_dose inSD: Double) -> Double {
        let output = (inSD / 2)
        return output
    }

    func convertSD_to_versed(standardized_dose inSD: Double) -> Double {
        return inSD
    }

    func convertSD_to_ativan(standardized_dose inSD: Double) -> Double {
        return inSD
    }

    func convertSD_to_klonopin(standardized_dose inSD: Double) -> Double {
        let output = (inSD / 2)
        return output
    }

    func convertSD_to_valium(standardized_dose inSD: Double) -> Double {
        let output = (inSD * 5)
        return output
    }

    func converter_result(choice: String, sd: Double) -> String {
        var x = 0.0
        switch choice {
            case ("Alprazolam"):
                 x = convertSD_to_xanax(standardized_dose: sd)
            case ("Midazolam"):
                 x = convertSD_to_versed(standardized_dose: sd)
            case ("Lorazepam"):
                 x = convertSD_to_ativan(standardized_dose: sd)
            case ("Clonazepam"):
                 x = convertSD_to_klonopin(standardized_dose: sd)
            case ("Diazepam"):
                 x = convertSD_to_valium(standardized_dose: sd)
            default:
                 x = 0.0
        }
        return "\(x)"
    }

    
    
    
    var body: some View {
        
        VStack {
            
                Section {
                    Text("Starting Dose")
                    TextField("mg", text: $input_dose)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            
                Section {
                    Picker(selection: $input_med, label: Text("Starting Medictaion")) {
                        ForEach(meds, id: \.self) { med in
                            Text("\(med)")
                        }
                    }
                    
                }
            
                Section {
                    Picker(selection: $output_med, label: Text("Desired Medication")) {
                        ForEach(meds, id: \.self) { med in
                            Text("\(med)")
                        }

                    }
                }
            
                Section {
                    Text("Result: \(converter_result(choice: output_med, sd: standardizeToAtivan(inM: input_med, inDs: input_dose))) mg")
                }
            
        
        }
        .navigationBarTitle("benzo conversion", displayMode: .inline)
        .modifier(DismissingKeyboard())
    }
}

    
    
struct BenzoConversion_Previews: PreviewProvider {
    static var previews: some View {
        BenzoConversion()
    }
}
