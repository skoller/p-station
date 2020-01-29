//
//  Scales.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/17/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Scales: View {
    var body: some View {
       
            List {
                NavigationLink("MDQ", destination: Mdq())
                NavigationLink("AIMS", destination: Aims())
            }.navigationBarTitle("Scales").font(.subheadline)
                
        
    }
}

struct Scales_Previews: PreviewProvider {
    static var previews: some View {
        Scales()
    }
}
