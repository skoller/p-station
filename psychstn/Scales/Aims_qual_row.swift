//
//  Aims_row.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/29/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Aims_qual_row: View {

let aims_q_quant = Bundle.main.decode([Aims_questions].self, from: "aims_0-9.json")
let aims_q_qual = Bundle.main.decode([Aims_qual_questions].self, from: "aims_10-13.json")
    
    
    @State private var q10: Bool = false
    @State private var q11: Bool = false
    @State private var q12: Bool = false
    @State private var q13: Bool = false
    @State private var def: Bool = false
    
    private var all_qual: [Bool] { [q10, q11, q12, q13] }
    
    
    func toggle(ans: Int) {
        switch ans {
        case 0:
            q10 = !q10
        case 1:
            q11 = !q11
        case 2:
            q12 = !q12
        case 3:
            q13 = !q13
        default:
            def = true
            
        }
    }
    
    var body: some View {
        let questions: [[Int]] = [[0,0], [1,1], [2,2], [3,3]]
        
        return ForEach(0..<questions.count, id: \.self) { tuple in
            HStack {
                ForEach(questions[tuple], id: \.self) { num in
                    Button(action: { self.toggle(ans: num) } ) {
                            Image(systemName: self.all_qual[num] ? "checkmark.square": "square")
                            Text("\(self.aims_q_qual[num].q)")
                    }
                }
            }
        }
    }
}


struct Aims_qual_row_Previews: PreviewProvider {
    static var previews: some View {
        Aims_qual_row()
    }
}
