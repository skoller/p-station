//
//  DSM-Vview.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/6/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct DSMVview: View {
    let dsm = Bundle.main.decode([DsmCategory].self, from: "dsm.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(dsm) { group in
                    Section(header: Text(group.category).fontWeight(.bold)
                    .font(.title)) {
                        ForEach(group.disorders) { dx in
                            Text(dx.name)
                            .fontWeight(.thin)
                            .font(.body)
                        }
                    }
                }
            }.navigationBarTitle("DSM 5 Quick Reference", displayMode: .inline)
        }
    }
}

struct DsmCategory: Codable, Identifiable {
    var id: UUID
    var category: String
    var disorders: [DsmDisorder]
}

struct DsmDisorder: Codable, Identifiable {
    var id: UUID
    var name: String
//  var description:
}


struct DSMVview_Previews: PreviewProvider {
    static var previews: some View {
        DSMVview()
    }
}
