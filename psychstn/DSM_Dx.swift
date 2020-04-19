//
//  DSM_Dx.swift
//  psychstn
//
//  Created by Nathan Skoller on 4/16/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct DSM_Dx: View {
    var dx: String
    var cat: String
    var dxdescr: String
    var crit: Array<String>
    
    var body: some View {
        
        List {
        Text("\(dxdescr)")
        ForEach(crit, id: \.self) {x in
            Text("\(x)")
        }
        }
    }
}

struct DSM_Dx_Previews: PreviewProvider {
    static var previews: some View {
        DSM_Dx(dx: "Namee", cat: "category!", dxdescr: "this is the description", crit: ["1", "2", "3"])
    }
}
