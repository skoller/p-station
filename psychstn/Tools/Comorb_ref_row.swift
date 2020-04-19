//
//  Comorb_ref_row.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/9/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Comorb_ref_row: View {
    
    let comorb_ref = Bundle.main.decode([Comorb_ref].self, from: "ComorbidityReferences.json")
    var i: String
    
    var body: some View {
        
            ForEach(comorb_ref) { item in
                NavigationLink("\(item.title)", destination: Comorb_ref_row(item: item))
            }
        }
    }
}

//struct Comorb_ref_row_Previews: PreviewProvider {
//    static var previews: some View {
//        Comorb_ref_row()
//    }
//}
