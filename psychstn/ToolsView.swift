//
//  ToolsView.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/6/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        NavigationView
               {


                   ZStack(alignment: .bottomTrailing) {
                       
                    
                       List {

                               HStack
                               {
                                   NavigationLink(destination: Calculators())
                                   {Text("Calculators")}
                               }
                               HStack
                               {
                                   NavigationLink(destination: QuickReferences())
                                   {Text("Quick References")}
                               }
                               HStack
                               {
                                   NavigationLink(destination: Scales())
                                   {Text("Scales")}
                               }
                            
                               HStack
                               {
                                   NavigationLink(destination: Treatment_Guidelines())
                                   {Text("Treatment Guidelines")}
                               }
                               HStack
                               {
                                   NavigationLink(destination: Articles())
                                   {Text("Article of the Month")}
                               }
                               HStack
                               {
                                   NavigationLink(destination: FloatingMenu())
                                   {Text("Floating Menu")}
                               }
                               HStack
                               {
                                   NavigationLink(destination: CheckView())
                                   {Text("Check box")}
                               }
                           }
                       .navigationBarTitle("Psych Station")
                       
                    
                        
                    
                        Rectangle()
                                .foregroundColor(.clear)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        FloatingMenu()
                                .padding()
                   }
           }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
