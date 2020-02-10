//
//  Aims.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/29/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Aims: View {
    @EnvironmentObject var scores: Scale_scores
    
    var body: some View {

            VStack {
                Divider()
                Text("Total Score: \(self.scores.aims_array.reduce(0, +))").font(.body).bold()
                Text("Positive Screen").foregroundColor(.green)
               Divider()
                
                Text("Question Key:").font(.caption)
                Text("0 = None, 1 = Minimum, 2 = Mild, 3 = Moderate, 4 = Severe").font(.caption)
                
                 Divider()
    
                List {
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
        Aims().environmentObject(Scale_scores())
    }
}
