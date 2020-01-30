//
//  Aims.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/29/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Aims: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView {
                Divider()
                Aims_quant_row()
                Aims_qual_row()
            }
            
        }.navigationBarTitle("Abnormal Involuntary Movement Scale (AIMS)", displayMode: .inline)
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
