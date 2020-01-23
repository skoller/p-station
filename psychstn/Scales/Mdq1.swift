//
//  scales.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/2/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI



struct Mdq1: View {
    @State var onstate1: Bool = false
    @State var onstate2: Bool = false
    @State var onstate3: Bool = false
    @State var onstate4: Bool = false
    @State var onstate5: Bool = false
    
    func score() -> Int {
         let all: [Bool] = [onstate1, onstate2, onstate3, onstate4, onstate5]
         let x = all.filter { $0 }
         return x.count
    }
    
    var title: String = "yes"
    
    func toggle1() {
        onstate1 = !onstate1
    }
    func toggle2() {
        onstate2 = !onstate2
    }
    func toggle3() {
        onstate3 = !onstate3
    }
    func toggle4() {
        onstate4 = !onstate4
    }
    func toggle5() {
        onstate5 = !onstate5
    }
    
    var body: some View {
        
            List {
                
                Text("Has there ever been a period of time when you were not your usual self and...")
                
                Text("Total Score: \(score())")
                
                HStack {
                    Text("...you felt so good or so hyper that other people thought you were not your normal self or you were so hyper that you got into trouble")
                        .padding(30).multilineTextAlignment(.leading)
                    Button(action: toggle1) {
                        
                        HStack{
                            Image(systemName: onstate1 ? "checkmark.square": "square")
                            Text(title)
    
                        }
                    }
                }
                
                HStack {
                    Text("...question 2 ")
                        .padding(30).multilineTextAlignment(.leading)
                    Button(action: toggle2) {
                        HStack{
                            Image(systemName: onstate2 ? "checkmark.square": "square")
                            Text(title)
    
                        }
                    }
                }
                HStack {
                    Text("...question 3")
                        .padding(30).multilineTextAlignment(.leading)
                    Button(action: toggle3) {
                        HStack{
                            Image(systemName: onstate3 ? "checkmark.square": "square")
                            Text(title)
    
                        }
                    }
                }
                HStack {
                    Text("...question 4")
                        .padding(30).multilineTextAlignment(.leading)
                    Button(action: toggle4) {
                        HStack{
                            Image(systemName: onstate4 ? "checkmark.square": "square")
                            Text(title)
    
                        }
                    }
                }
                HStack {
                    Text("...question 5")
                        .padding(30).multilineTextAlignment(.leading)
                    Button(action: toggle5) {
                        HStack{
                            Image(systemName: onstate5 ? "checkmark.square": "square")
                            Text(title)
    
                        }
                    }
                }
                

            }.navigationBarTitle("Mood Disorder Questionnaire", displayMode: .inline)
          
        
    }
}



struct scales_Previews: PreviewProvider {
    static var previews: some View {
        Mdq1()
    }
}

