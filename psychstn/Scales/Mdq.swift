//
//  Mdq.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/22/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Mdq: View {
    @State private var onstate0: Bool = false
    @State private var onstate1: Bool = false
    @State private var onstate2: Bool = false
    @State private var onstate3: Bool = false
    @State private var onstate4: Bool = false
    @State private var onstate5: Bool = false
    @State private var onstate6: Bool = false
    @State private var onstate7: Bool = false
    @State private var onstate8: Bool = false
    @State private var onstate9: Bool = false
    @State private var onstate10: Bool = false
    @State private var onstate11: Bool = false
    @State private var onstate12: Bool = false
    @State private var onstate13: Bool = false
    @State private var def: Bool = false
    private var all: [Bool] { [onstate0, onstate1, onstate2, onstate3, onstate4, onstate5, onstate6, onstate7, onstate8, onstate9, onstate10, onstate11, onstate12, onstate13] }
    
    
    func score() -> Int {
        let all_scored: [Bool] = [onstate0, onstate1, onstate2, onstate3, onstate4, onstate5, onstate6, onstate7, onstate8, onstate9, onstate10, onstate11, onstate12, onstate13]
        let x = all_scored.filter { $0 }
        return x.count
    }
    
    func toggle(ans: Int) {
        switch ans {
        case 0:
            onstate0 = !onstate0
        case 1:
            onstate1 = !onstate1
        case 2:
            onstate2 = !onstate2
        case 3:
            onstate3 = !onstate3
        case 4:
            onstate4 = !onstate4
        case 5:
            onstate5 = !onstate5
        case 6:
            onstate6 = !onstate6
        case 7:
            onstate7 = !onstate7
        case 8:
            onstate8 = !onstate8
        case 9:
            onstate9 = !onstate9
        case 10:
            onstate10 = !onstate10
        case 11:
            onstate11 = !onstate11
        case 12:
            onstate12 = !onstate12
        case 13:
            onstate13 = !onstate13
        default:
            def = true
            
        }
    }
    
    let mdq_q = Bundle.main.decode([Mdq_questions].self, from: "mdq.json")
    
    let title: String = "yes"
    @State private var question14 = 0
    let question14items = ["No Problem", "Minor Problem", "Moderate Problem", "Serious Problem"]
    
    var body: some View {
        
        VStack {
            
            Text("Has there ever been a period of time when you were not your usual self and...").padding(20)
            Divider()
            Text("Total Score: \(score())")
            Divider()
            
            List {
                ForEach(mdq_q) { i in
                    HStack {
                        Text(i.q).padding(20)
                        Button(action: { self.toggle(ans: i.id) } ) {
                            HStack{
                                Image(systemName: self.all[i.id] ? "checkmark.square": "square")
                                Text(self.title)
                                
                            }
                        }
                    }
                }.padding().addBorder(Color.gray, width: 2, cornerRadius: 10).padding(5)
                
                VStack {
                    
                    
                    Picker(selection: self.$question14, label: Text("Severity")) {
                        ForEach(0..<self.question14items.count) { index in
                            Text(self.question14items[index]).tag(index).font(.subheadline)
                        }
                        }.pickerStyle(WheelPickerStyle()).labelsHidden()
                    Text("How much of a problem did any of these cause you – like being unable to work; having family, money or legal troubles; getting into arguments or fights?")
                }.padding().addBorder(Color.gray, width: 2, cornerRadius: 10).padding(5)
            }.navigationBarTitle("Mood Disorder Questionnaire", displayMode: .inline)
        }
    }
}

struct Mdq_questions: Codable, Identifiable {
    var id: Int
    var q: String
}

struct Mdq_Previews: PreviewProvider {
    static var previews: some View {
        Mdq()
    }
}
