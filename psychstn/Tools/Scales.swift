//
//  Scales.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/17/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Scales: View {
    @EnvironmentObject var scores: Scale_scores
    var body: some View {
       
            List {
                NavigationLink("MDQ", destination: Mdq())
                NavigationLink("AIMS", destination: Aims())
                NavigationLink("ASRS", destination: Asrs())
//                NavigationLink("BFCRS", destination: Bfcrs())
                NavigationLink("PHQ-9", destination: Phq9())
//                NavigationLink("GAD-7", destination: Gad7())
            }.navigationBarTitle("Scales").font(.subheadline)
                
        
    }
}

struct Scales_Previews: PreviewProvider {
    static var previews: some View {
        Scales().environmentObject(Scale_scores())
    }
}
