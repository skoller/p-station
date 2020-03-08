//
//  Gad7_row.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/8/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Gad7_row: View {
        
        @EnvironmentObject var scores: Scale_scores

            let gad7_qs = Bundle.main.decode([Gad7_questions].self, from: "gad7.json")
            
            var body: some View {
                   let ques: [[Int]] = [[20,0], [21,1], [22,2], [23,3], [24,4], [25,5], [26,6]]



                        return ForEach(0..<ques.count, id: \.self) { pair in
                            VStack {
                                ForEach(ques[pair], id: \.self) { num in
                                    HStack {
                                        if num < 20 {
                                            Text("\(self.gad7_qs[pair].q)")
                                        }
                                        if num > 19 {
                                            VStack {
                                                Picker(selection: self.$scores.gad7_array[pair], label: Text("Severity")) {
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

        struct Gad7_questions: Codable, Identifiable {
            var id: Int
            var q: String
        }

        struct Gad7_row_Previews: PreviewProvider {
            static var previews: some View {
                Gad7_row()
            }
        }
