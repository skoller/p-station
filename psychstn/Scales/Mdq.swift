//
//  scales.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/2/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI



struct Mdq: View {
    @State var onstate1: Bool = false
    @State var onstate2: Bool = false
    @State var onstate3: Bool = false
    
    func score() -> Int {
         let all_array: [Bool] = [onstate1, onstate2, onstate3]
         let x = all_array.filter { $0 }
         return x.count
    }
    
    @State var isChecked: Bool = false
    var title: String = "yes"
    
    func toggle() {
        isChecked = !isChecked
    }
    
    var body: some View {
        
       
            List {
                Text("Has there ever been a period of time when you were not your usual self and...")
                Text("Total Score: \(score())")
                HStack {
                    Text("you felt so good or so hyper that other people thought you were not your normal self or you were so hyper that you got into trouble").padding(10)
                    Button(action: toggle) {
                        HStack{
                            Image(systemName: isChecked ? "checkmark.square": "square")
                            Text(title)
    
                        }
                    }
                    
                }
                
                
                
                
//                Toggle(isOn: $onstate1) {
//                    Text("you felt so good or so hyper that other people thought you were not your normal self or you were so hyper that you got into trouble")
//                }
//                Toggle(isOn: $onstate2) {
//                    Text("you felt so good or so hyper that other people thought you were not your normal self or you were so hyper that you got into trouble")
//                }
//                Toggle(isOn: $onstate3) {
//                    Text("you felt so good or so hyper that other people thought you were not your normal self or you were so hyper that you got into trouble")
//                }
            }.navigationBarTitle("Mood Disorder Questionnaire", displayMode: .inline)
          
        
    }
}



struct scales_Previews: PreviewProvider {
    static var previews: some View {
        Mdq()
    }
}

