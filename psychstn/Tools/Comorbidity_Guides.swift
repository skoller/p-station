//
//  Treatment Guidelines.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/17/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct Comorbidity_Guides: View {
    
    let comorb_guide = Bundle.main.decode([Comorb_guide].self, from: "comorbidity_guides.json")
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(comorb_guide) { group in
                    Section(header: Text(group.title).fontWeight(.bold)
                        .font(.title)) {
                           Text("Content Pop-up Link")
                    }
                }
            }.navigationBarTitle("Comorbidity Guides", displayMode: .inline)
        }
        
    }
}

struct Comorb_guide: Codable, Identifiable {
    var id: Int
    var title: String
    var content: String
}

struct Comorbidity_Guides_Previews: PreviewProvider {
    static var previews: some View {
        Comorbidity_Guides()
    }
}
