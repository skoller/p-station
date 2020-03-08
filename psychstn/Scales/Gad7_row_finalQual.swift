//
//  GAd7_row_finalQual.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/8/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Gad7_row_finalQual: View {
    @EnvironmentObject var scores: Scale_scores
    let quest: [[Int]] = [[20,0]]
  
    
   let q = ["Not Difficult at All", "Somewhat Difficult", "Very Difficult", "Extremely Difficult"]
    
    var body: some View {
      
      


        return ForEach(0..<quest.count, id: \.self) { pair in
            VStack {
                ForEach(self.quest[pair], id: \.self) { num in
                    HStack {
                        if num < 20 {
                            Text("If you checked off any problems, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?")
                        }
                        if num > 19 {
                            VStack {
                                Picker("Severity", selection: self.$scores.gad7_q8) {
                                    ForEach(self.q, id: \.self) { n in
                                        Text("\(n)")
                                    }
                                }
                                .labelsHidden()
                            
                            }
                        }
                    }
                }
            }.padding().addBorder(Color.gray, width: 2, cornerRadius: 10).padding(5)
        }
    }
}

struct Gad7_row_finalQual_Previews: PreviewProvider {
    static var previews: some View {
        Gad7_row_finalQual()
    }
}

