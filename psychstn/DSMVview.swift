//
//  DSM-Vview.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/6/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI


let dsm = Bundle.main.decode([DsmCategory].self, from: "dsm.json")

struct DSMVview: View {
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dsm) { group in
                    Section(header: Text(group.category).fontWeight(.bold)
                    .font(.title)) {
                        ForEach(group.disorders) { dx in
                            HStack {
                                NavigationLink(destination: DSM_Dx(dx: dx.name, cat: group.category, dxdescr: dx.description, crit: dx.criteria))
                                    { Text(dx.name)
                                        .fontWeight(.thin)
                                        .font(.body)
                                        .foregroundColor(.blue)
                                    }
                            }
                        }.frame(height: 60)
                    }
                }
            }.navigationBarTitle("DSM 5 Quick Reference", displayMode: .inline)
        }
    }
}

class DsmCategory: Codable, Identifiable {
    var id: UUID
    var category: String
    var disorders: [DsmDisorder]
}

class DsmDisorder: Codable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var criteria: Array<String>
}

class DsmCriteria: Codable {}

struct DSMVview_Previews: PreviewProvider {
    static var previews: some View {
        DSMVview()
    }
}


//["1", "2", "3"]
