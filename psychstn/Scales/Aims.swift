//
//  Aims.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/29/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Aims: View {
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
    
    @State private var q10: Bool = false
    @State private var q11: Bool = false
    @State private var q12: Bool = false
    @State private var q13: Bool = false
  
    @State private var def: Bool = false
    private var all_quant: [Int] { [q0, q1, q2, q3, q4, q5, q6, q7, q8, q9] }
    private var all_qual: [Bool] { [q10, q11, q12, q13] }
    
    
    func quant_score() -> Int {
        let all_scored: [Int] = [q0, q1, q2, q3, q4, q5, q6, q7, q8, q9]
        let x = all_scored.reduce(0, +)
        return x
    }
    
    func qual_score() -> [Bool] {
        let all_qual_scored: [Bool] = [q10, q11, q12, q13]
        return all_qual_scored
    }
    
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
    
    let aims_q_quant = Bundle.main.decode([Aims_questions].self, from: "aims_0-9.json")
    let aims_q_qual = Bundle.main.decode([Aims_qual_questions].self, from: "aims_10-13.json")
    
    let title: String = "yes"
    @State private var question14 = 0
    let question14items = ["No Problem", "Minor Problem", "Moderate Problem", "Serious Problem"]
    
    var body: some View {
        
        VStack {
            
            
            Text("Total Score: \(quant_score())")
            Divider()
            Aims_qual_row()
            
            
            
            
            
//            ScrollView {
//                ForEach(0..<15) { _ in
//                    HStack {
//                        ForEach(0..<2) {_ in
//
//                                ForEach(self.aims_q_qual) { i in
//                                    Button(action: { self.toggle(ans: i.id) } ) {
//                                        HStack{
//                                            Image(systemName: self.all_qual[i.id] ? "checkmark.square": "square")
//                                            Text(self.title)
//
//                                        }
//                                    }
//                                }
//                        }
//                    }
//                }

                
                
//                    VStack(alignment: .leading) {
//                        ForEach(self.aims_q_qual) { i in
//                            Text(i.q).padding(20)
//                        }
//                    }
//                }
                
                
//                }
//                VStack {
//                    Text(" How much of a problem did any of these cause you – like being unable to work; having family, money or legal troubles; getting into arguments or fights?")
//
//                    Picker(selection: self.$question14, label: Text("Severity")) {
//                        ForEach(0..<self.question14items.count) { index in
//                            Text(self.question14items[index]).tag(index).font(.subheadline)
//                        }
//                    }.pickerStyle(SegmentedPickerStyle())
//                }
            }.navigationBarTitle("Abnormal Involuntary Movement Scale (AIMS)", displayMode: .inline)
//        }
    }
}



struct Aims_questions: Codable, Identifiable {
    var id: Int
    var q: String
}

struct Aims_qual_questions: Codable, Identifiable {
    var id: Int
    var q: String
}

struct Aims_Previews: PreviewProvider {
    static var previews: some View {
        Aims()
    }
}



//                ForEach(aims_q_quant) { item in
//                    HStack {
//                        Text(item.q).padding(20)
//                        Picker(selection: self.$question14, label: Text("\(item.id)")) {
//                                Text("0")
//                               .font(.subheadline)
//                                }
//                        }.pickerStyle(SegmentedPickerStyle())
//                    }
//                }
