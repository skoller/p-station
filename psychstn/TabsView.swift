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
    
    @EnvironmentObject var scores: Scale_scores
    @State private var selection = 0
    
    init() {
        setupTabBar()
    }
    
    var body: some View {
        
       
        TabView(selection: $selection){
            
            ToolsView()
                .font(.title)
                .tabItem {
                    HStack {
                        
//                        Image("015-briefcase")
                        Text("Tools")
                    }
            }
            .tag(0)
            
    
            
            
            PatientsView()
                .font(.title)
                .tabItem {
                    VStack {
//                        Image("icons8-crowd-50")
                        Text("Patients")
                    }
            }
            .tag(1)
            
            SettingsView()
                .font(.title)
                .tabItem {
                    VStack {
//                        Image("icons8-account-50")
                        Text("Account").fontWeight(.heavy).font(.title)
                    }
            }
            .tag(2)
        }
        .accentColor(.blue)
        .opacity(1)
    }
}

//----------------------------------------------
extension TabsView {
    func setupTabBar() {
        UITabBar.appearance().barTintColor = .lightGray
        UITabBar.appearance().tintColor = .blue
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
    }
}
//---------------------------------------------

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView().environmentObject(Scale_scores())
    }
}



