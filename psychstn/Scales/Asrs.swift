//
//  Asrs.swift
//  psychstn
//
//  Created by Nathan Skoller on 2/10/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Asrs: View {
    
    @EnvironmentObject var scores: Scale_scores
    
    var body: some View {
       VStack {
        Divider()
//        Text("Total Score: \(self.scores.asrs_array.reduce(0, +))").font(.body).bold()
        Text("Positive Screen").foregroundColor(.green)
        Divider()
       }.navigationBarTitle("ADHD Self-Report Scale", displayMode: .inline)
    }
}

struct asrs_questions: Codable, Identifiable {
    var id: Int
    var q: String
}


struct Asrs_Previews: PreviewProvider {
    static var previews: some View {
        Asrs()
    }
}
