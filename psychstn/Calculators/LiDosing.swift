//
//  LiDosing.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/17/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct LiDosing: View {
    
    @State private var wt = ""
    @State private var age = ""
    @State private var bun = ""
    @State private var sex = false
    @State private var tca = false
    @State private var inpt = false
    @State private var gc_selection = 0
    let goals = ["0.6", "0.7", "0.8", "0.9", "1.0", "1.1", "1.2"]
    @State private var lbs_selection = 0
    let units = ["lbs", "kg"]
    
    var wt_to_kg: String {
        if lbs_selection == 1 {
            let x = Double(wt) ?? 0
            return String(x/2.205)
        }
        else {
            return wt
        }
    }
    

    var final_terao_dose: Double {
            let final_wt = Double(wt_to_kg) ?? 0
            let final_age = Double(age) ?? 0
            let final_bun = Double(bun) ?? 0
            let goal_conc = Double(goals[gc_selection]) ?? 0
            let gc_ = 752.7 * goal_conc
            let age_ = 3.6 * final_age
            let wt_ = 7.2 * final_wt
            let bun_ = 13.7 * final_bun
              var terao_dose = 100.5 + gc_ - age_ + wt_ - bun_
                if final_wt == 0 || final_age == 0 || final_bun == 0 || goal_conc == 0 { terao_dose = 0.0 }
        return terao_dose
        }

    var final_zetin_dose: Double {
            let final_wt = Double(wt) ?? 0
            let final_age = Double(age) ?? 0
            let goal_conc = Double(goals[gc_selection]) ?? 0
            var final_sex = 0.0
            var final_inpt = 0.0
            var final_tca = 0.0
            if sex { final_sex = 1 }
            if inpt { final_inpt = 1 }
            if tca { final_tca = 1 }
            let conc_ = 746.83 * goal_conc
            let age_ = 10.08 * final_age
            let wt_ = 5.95 * final_wt
            let sex_ = 147.8 * final_sex
            let inpt_ = 92.01 * final_inpt
            let tca_ = 74.73 * final_tca

              var zetin_dose = 486.8 + conc_ - age_ + wt_ + sex_ + inpt_ - tca_
                if final_wt == 0 || final_age == 0 || goal_conc == 0 { zetin_dose = 0.0 }
              return zetin_dose
        }
    

    func display_dose(_ input: Double) -> String {
        if input == 0.0 {
            return ""
        }
        else {
            return String(Int(input)) + " mg"
        }
    }
    
    
    
    
    var body: some View {

        VStack {
            List {
                Text("Goal Serum Concentration")
                    .font(.subheadline)
                Picker(selection: $gc_selection, label: Text("Goal")) {
                        ForEach(0..<goals.count) { index in
                            Text(self.goals[index]).tag(index)
                        }
                }
                
                .pickerStyle(SegmentedPickerStyle())
             

                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("BUN", text: $bun)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("\(self.units[lbs_selection])", text: $wt)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
          
                Section(header: Text("Total Dose / Day:")) {
                    Text("Terao: \(display_dose(final_terao_dose))")
                    Text("Zetin: \(display_dose(final_zetin_dose))")
                }

            }
            .navigationBarTitle("Lithium Dose Calculator", displayMode: .inline)
            .modifier(DismissingKeyboard())
        }
    
    }
}
        



                     //
                     //
                     //
                     //                Picker(selection: $lbs_selection, label: Text("units")) {
                     //                           ForEach(0..<units.count) { index in
                     //                                      Text(self.units[index]).tag(index)
                     //                           }
                     //                 }.pickerStyle(SegmentedPickerStyle())
                     //                  .foregroundColor( (lbs_selection == 0) ? .blue : .green)
                     //
                     //
                     //
                     //




struct LiDosing_Previews: PreviewProvider {
    static var previews: some View {
        LiDosing()
    }
}
