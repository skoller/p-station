//
//  Aims_quant_row.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/29/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Aims_quant_row: View {
    let aims_q_quant = Bundle.main.decode([Aims_questions].self, from: "aims_0-9.json")
    
    
    @State private var q0: Int = 0
    @State private var q1: Int = 0
    @State private var q2: Int = 0
    @State private var q3: Int = 0
    @State private var q4: Int = 0
    @State private var q5: Int = 0
    @State private var q6: Int = 0
    @State private var q7: Int = 0
    @State private var q8: Int = 0
    @State private var q9: Int = 0
    @State private var def: Int = 0
    
    @State private var severity: [Int] = [0, 1, 2, 3, 4]
    
    @State private var all_quant: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    func quant_score() -> Int {
        let x = all_quant.reduce(0, +)
        return x
    }
    
     
    
    var body: some View {
        
        let questions: [[Int]] = [[20,0], [21,1], [22,2], [23,3], [24,4], [25,5], [26,6], [27,7], [28,8], [29,9]]
        
        return ForEach(0..<questions.count, id: \.self) { pair in
                HStack {
                    ForEach(questions[pair], id: \.self) { num in
                        HStack {
                            Text("\(String(self.quant_score()))")
                            if num > 19 {
                                Picker(selection: self.$all_quant[pair], label: Text("Severity")) {
                                    ForEach(0...4, id: \.self) {y in Text(String(y))}
                                }.pickerStyle(SegmentedPickerStyle())
                                
                            }
                            if num < 20 {
                                Text("\(self.aims_q_quant[pair].q)")
                            }
                        }
                    }
                }
            }
        
    }
}

struct Aims_quant_row_Previews: PreviewProvider {
    static var previews: some View {
        Aims_quant_row()
    }
}
