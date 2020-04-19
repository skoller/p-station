//
//  QuickReferences.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/17/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Landmark_Publications: View {
    var body: some View {
            List {
                Text("STAR-D(2006)")
                Text("CATIE(2005)")
                Text("CATIE-AD")
                Text("STEP-BD")
                Text("Symptom-triggered vs fixed-schedule doses of benzodiazepine for alcohol withdrawal: a randomized treatment trial")
                Text("SADHART")
                Text("MIND-USA")
            }.navigationBarTitle("Landmark Publications")
        
    }
}

struct Landmark_Publications_Previews: PreviewProvider {
    static var previews: some View {
        Landmark_Publications()
    }
}
