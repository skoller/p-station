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
  
        NavigationView {
                ScrollView {
                    Divider()
                        HStack {
                            NavigationLink(destination: Calculators())
                             {Text("Calculators")
                             .foregroundColor(.white)}
                             }
                           
                    Divider()
                        HStack {
                           NavigationLink(destination: QuickReferences())
                            {Text("Quick References")
                            .foregroundColor(.white)}
                            }
                    Divider()
                       HStack {
                           NavigationLink(destination: Scales())
                            {Text("Scales")
                            .foregroundColor(.white)}
                            }
                    Divider()
                       HStack {
                           NavigationLink(destination: Treatment_Guidelines())
                            {Text("Treatment Guidelines")
                            .foregroundColor(.white)}
                            }
                    Divider()
                       HStack {
                           NavigationLink(destination: Articles())
                            {Text("Article of the Month")
                            .foregroundColor(.white)
                            }
                    }
                }
                .background(Color(red: 050/255, green: 130/255, blue: 160/255))
                    
                .navigationBarTitle("Psych Station")
                .navigationBarItems(
                    leading:
                        Text("Search")
                        .font(.subheadline),
                    trailing:
                        Text("About")
                        .font(.subheadline)
                    .edgesIgnoringSafeArea(.all)
                    
                )
                
                    
                
        Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        FloatingMenu()
            
                           
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
