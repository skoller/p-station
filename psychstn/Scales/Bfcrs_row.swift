//
//  Bfcrs_row.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/8/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Bfcrs_row: View {
    
    @EnvironmentObject var scores: Scale_scores

    let bfcrs_qs = Bundle.main.decode([Bfcrs_questions].self, from: "bfcrs.json")
    
    var body: some View {
           let ques: [[Int]] = [[30,0], [31,1], [32,2], [33,3], [34,4], [35,5], [36,6], [37,7], [38,8], [39,9], [40,10], [41,11], [42,12], [43,13], [44,14], [45,15], [46,16], [47,17], [48,18], [49,19], [50,20],[51,21], [52,22]]



                return ForEach(0..<ques.count, id: \.self) { pair in
                    VStack {
                        ForEach(ques[pair], id: \.self) { num in
                            HStack {
                                if num < 30 {
                                    Text("\(self.bfcrs_qs[pair].q)")
                                }
                                if num > 29 {
                                    VStack {
                                        Picker(selection: self.$scores.bfcrs_array[pair], label: Text("Severity")) {
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

struct Bfcrs_questions: Codable, Identifiable {
    var id: Int
    var q: String
}

struct Bfcrs_row_Previews: PreviewProvider {
    static var previews: some View {
        Bfcrs_row()
    }
}

