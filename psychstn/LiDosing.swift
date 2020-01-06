//
//  LiDosing.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/17/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct LiDosing: View
{
    
    @State private var wt = ""
    @State private var age = ""
    @State private var bun = ""
    @State private var gc = ""
    
    let goals = ["0.05", "0.1", "0.15", "0.2", "0.25", "0.3", "0.35", "0.4", "0.45", "0.5", "0.55", "0.6", "0.65", "0.7", "0.75", "0.8", "0.85", "0.9", "0.95", "1.0", "1.05", "1.1", "1.15", "1.2"]
    
    var recd_terao_dose: Double
    {
        let final_wt = Double(wt) ?? 0
        let final_age = Double(age) ?? 0
        let final_bun = Double(bun) ?? 0
        let goal_conc = Double(gc) ?? 0
        //calc value here
        let terao_dose = 100.5 + (752.7 * goal_conc) - (3.6 * final_age) + (7.2 * final_wt) - (13.7 * final_bun)
        return terao_dose
    }
    

    
//    daily lithium carbonate dose (in milligrams) = 100.5 + 752.7 x (expected lithium concentration in millimoles per liter) - 3.6 x (age in years) + 7.2 x (weight in kilograms) - 13.7 x (blood urea nitrogen [BUN] in milligrams per deciliter)
    var body: some View
    {
        
            Form
            {
                Section
                {
                    Picker(selection: $gc, label: Text("Goal Concentration in mmmol/L"))
                    {
                        ForEach(0..<goals.count) {
                            Text(self.goals[$0])
                        }
                        
                    }.pickerStyle(WheelPickerStyle())
                }
                
            
                Section
                {
                    TextField("Age", text: $age)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Weight", text: $wt)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("BUN", text: $bun)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                     
                }
    
                Section
                {
                Text("Terao: \(recd_terao_dose)")
                Text("Zetin: \(wt+age+bun)")
                                      
                }
                
            }
            .modifier(DismissingKeyboard())
            .navigationBarTitle("Lithium", displayMode: .inline)
        
    }
}

//func(_ $age: inout String, _ $wt: inout String, _ $bun: inout String) -> String do {
//    return ($age + $wt + $bun)
//}
//
//func zetin(age age: Double, wt wt: Double, cr cr: Double) -> Double
//{
//    
//}

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
        }
    }
}

struct LiDosing_Previews: PreviewProvider {
    static var previews: some View {
        LiDosing()
    }
}
