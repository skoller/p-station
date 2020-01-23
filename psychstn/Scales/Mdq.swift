//
//  Mdq1.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/22/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Mdq: View {
       @State var onstate0: Bool = false
       @State var onstate1: Bool = false
       @State var onstate2: Bool = false
       @State var onstate3: Bool = false
       @State var onstate4: Bool = false
       @State var onstate5: Bool = false
       @State var onstate6: Bool = false
       @State var onstate7: Bool = false
       @State var onstate8: Bool = false
       @State var onstate9: Bool = false
       var all: [Bool] { [onstate0, onstate1, onstate2, onstate3, onstate4, onstate5, onstate6, onstate7, onstate8, onstate9] }
   
    
       func score() -> Int {
            let all_scored: [Bool] = [onstate0, onstate1, onstate2, onstate3, onstate4, onstate5, onstate6, onstate7, onstate8, onstate9]
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
            default:
               false
        }
    }
    
    let mdq_q = Bundle.main.decode([Mdq_questions].self, from: "mdq.json")
    
    let title: String = "yes"

    var body: some View {
        
        
        
        
        List {
            Text("Has there ever been a period of time when you were not your usual self and...").padding(20)
            
            Text("Total Score: \(score())")
            
            ForEach(mdq_q) { i in
                ScrollView {
                    HStack {
                        Text(i.q)
                                .padding(30)
                            
                        Button(action: { self.toggle(ans: i.id) } ) {
                            HStack{
                                Image(systemName: self.all[i.id] ? "checkmark.square": "square")
                                Text(self.title)

                            }
                        }
                    }
                }
            }
        }.navigationBarTitle("Mood Disorder Questionnaire", displayMode: .inline)
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
