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
                List {
                 
                        HStack {
                            NavigationLink(destination: Calculators())
                             {Text("Calculators")
                             .fontWeight(.thin)
                             .font(.body)
                             .foregroundColor(.blue)}
                        }.frame(height: 60)
                           
                   
                        HStack {
                           NavigationLink(destination: QuickReferences())
                            {Text("Quick References")
                            .fontWeight(.thin)
                            .font(.body)
                            .foregroundColor(.blue)}
                            }.frame(height: 60)
                  
                       HStack {
                           NavigationLink(destination: Scales())
                            {Text("Scales")
                            .fontWeight(.thin)
                            .font(.body)
                            .foregroundColor(.blue)}
                            }.frame(height: 60)
               
                       HStack {
                           NavigationLink(destination: Treatment_Guidelines())
                            {Text("Treatment Guidelines")
                            .fontWeight(.thin)
                            .font(.body)
                            .foregroundColor(.blue)}
                            }.frame(height: 60)
                
                       HStack {
                           NavigationLink(destination: Articles())
                            {Text("Article of the Month")
                                
                                .fontWeight(.thin)
                                .font(.body)
                                .foregroundColor(.blue)
                            }.frame(height: 60)
                    }
                }
                .background(Color(red: 050/255, green: 130/255, blue: 160/255))
                .navigationBarTitle("Psych Station", displayMode: .inline)
                
//                .navigationBarItems(
//                    leading:
//                        Text("Search")
//                        .font(.subheadline),
//                    trailing:
//                        Text("About")
//                        .font(.subheadline))
                        
                
                    
//
//        Rectangle()
//                .foregroundColor(.clear)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//        FloatingMenu()
            
                           
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
