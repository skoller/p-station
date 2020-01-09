//
//  Calculators.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/17/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

//struct Calc
//{
//    var name: String
//}

struct Calculators: View {
//
//    let calcs = [
//        Calc(name: "Lithium Dosing", link: LiDosing()),
//        Calc(name: "Depakote Dosing", link: DepakoteDosing()),
//        Calc(name: "Benzodiazepine Conversion", link: BenzoConversion())
//    ]
    
    
//    lazy var calcs = [a, b, c] as [Any]
    
    
    
    var body: some View {
            List
            {
                NavigationLink("Benzo Conversion", destination: BenzoConversion())
//                ForEach(calcs, id: \.self
//                { y in
//                    NavigationLink(destination: Text("test"))
//                    {
//                        Text(y.name)
//                    }
//                }
        }.navigationBarTitle("Calculators")
      

    }
}

struct Calculators_Previews: PreviewProvider {
    static var previews: some View {
        Calculators()
    }
}


//ContentView
//    Calcs / Tools
        
//    Treatment_Guidelines
//    Medications
//    Scales
//    Articles
//
