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


struct TabsView: View {

@State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection){
                
            ToolsView()
                    .font(.title)
                    .tabItem {
                        HStack {
                            
                            Image("015-briefcase")
                            Text("Tools")
                        }
                    }
                    .tag(0)
            
            
                DSMVview()
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image("005-knowledge")
                            Text("DSM-V")
                        }
                    }.tag(1)
            
            
            
                MedicationsView()
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image("001-pills")
                                Text("Meds")
                            }
                        }
                        .tag(2)
                    Text("Fourth View")
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image("019-favorite")
                                Text("Settings")
                            }
                        }
                    .tag(3)
            }
        }
}

//----------------------------------------------


//---------------------------------------------

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
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
  
