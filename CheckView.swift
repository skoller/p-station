//
//  CheckView.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/5/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct CheckView: View {
    
    @State var isChecked: Bool = false
    var title: String = "yes"
    
    func toggle(){
        isChecked = !isChecked
    }
    
    var body: some View {
            Button(action: toggle){
                HStack{
                    Image(systemName: isChecked ? "checkmark.square": "square")
                    Text(isChecked ? title : "")
                }
            }
    }

}


