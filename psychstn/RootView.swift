//
//  ContentView.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/16/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI


    struct MainMenuItem
    {
        var name: String
        var icon: String
        var favorite: Bool
    }


struct RootView: View {


    
    var body: some View {
        
        NavigationView
        {
            
            
            ZStack(alignment: .topLeading) {
                                       
                           
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
                            NavigationLink(destination: Medications())
                            {Text("Medications")}
                        }
                        HStack
                        {
                            NavigationLink(destination: Treatment_Guidelines())
                            {Text("Treatment Guidelines")}
                        }
                        HStack
                        {
                            NavigationLink(destination: DSM())
                            {Text("DSM V Criteria")}
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
                    }.navigationBarTitle("Psych Station")
//                    .navigationBarItems(trailing: FloatingMenu())
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                FloatingMenu()
//                .padding()
//                .frame(alignment: .topLeading)
                }
            }
    }
}

//----------------------------------------------


//---------------------------------------------

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}


//    let menuItems =
//    [
//        MainMenuItem(name: "Calcs", icon: "1", favorite: false),
//        MainMenuItem(name: "Quick References", icon: "2", favorite: false),
//        MainMenuItem(name: "Scales", icon: "3", favorite: false)
//    ]
//    let ca = Calculators()
//    let qr = QuickReferences()
//    let sc = Scales()
//
  
