//
//  Calculators.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/17/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Calculators: View {
 
    var body: some View {
        List {
                NavigationLink("Benzo Conversion", destination: BenzoConversion())
                NavigationLink("Lithium Dosing", destination: LiDosing())
        }.navigationBarTitle("Calculators")
      

    }
}

struct Calculators_Previews: PreviewProvider {
    static var previews: some View {
        Calculators()
    }
}
