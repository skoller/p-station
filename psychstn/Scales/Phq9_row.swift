//
//  Phq9_row.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/7/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Phq9_row: View {
    
    @EnvironmentObject var scores: Scale_scores

    let phq9_qs = Bundle.main.decode([Phq9_questions].self, from: "phq9.json")
    
    var body: some View {
           let ques: [[Int]] = [[20,0], [21,1], [22,2], [23,3], [24,4], [25,5], [26,6], [27,7], [28,8]]



                return ForEach(0..<ques.count, id: \.self) { pair in
                    VStack {
                        ForEach(ques[pair], id: \.self) { num in
                            HStack {
                                if num < 20 {
                                    Text("\(self.phq9_qs[pair].q)")
                                }
                                if num > 19 {
                                    VStack {
                                        Picker(selection: self.$scores.phq9_array[pair], label: Text("Severity")) {
                                            ForEach(0...3, id: \.self) {y in
                                                Text(String(y))
                                            }
                                        }.pickerStyle(SegmentedPickerStyle())
                                    }
                                }
                            }
                        }
                    }.padding().addBorder(Color.gray, width: 2, cornerRadius: 10).padding(5)
                }
        
    }
}

struct Phq9_questions: Codable, Identifiable {
    var id: Int
    var q: String
}

struct Phq9_row_Previews: PreviewProvider {
    static var previews: some View {
        Phq9_row()
    }
}
