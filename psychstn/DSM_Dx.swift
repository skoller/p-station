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
    var dx_descr: String
    var crit_req: String
    var crit: Array<String>
    
    var body: some View {
        
        List {
            Text("\(dx)")
                .underline()
            if dx_descr != "" {
                Text("\(dx_descr)")
                    .fontWeight(.thin)
                    .font(.body)
                    .foregroundColor(.black)
            }
            
            Text("Criteria Requirements: ").fontWeight(.thin)
            if crit_req != "" {
                Text("\(crit_req)")
                    .fontWeight(.thin)
                    .font(.body)
                    .foregroundColor(.black)
                    .underline()
            }
            
            ForEach(crit, id: \.self) {x in
                Text("\(x)")
                    .fontWeight(.thin)
                    .font(.body)
                    .foregroundColor(.black)
            }
            
        }.listSeparatorStyleNone()
    }
}

struct DSM_Dx_Previews: PreviewProvider {
    static var previews: some View {
        DSM_Dx(dx: "Intellecutal Disability", dx_descr: "", crit_req: "must meet all", crit: ["1", "2", "3"])
    }
}
