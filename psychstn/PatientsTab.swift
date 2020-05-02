//
//  Patients.swift
//  psychstn
//
//  Created by Nathan Skoller on 5/2/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct PatientsTab: View {
    
    @EnvironmentObject var patient_census: PatientCensus
    
    var body: some View {
        List {
            ForEach(patient_census.patients, id: \.self ) { pt in
                Text("\(pt)")
            }
        }
    }
}

struct PatientsTab_Previews: PreviewProvider {
    static var previews: some View {
        PatientsTab()
    }
}
