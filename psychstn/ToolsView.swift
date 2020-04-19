//
//  ToolsView.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/6/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

let delegate = UIApplication.shared.delegate as! AppDelegate
let times = delegate.currentTimesOfOpenApp

struct ToolsView: View {
    
    @EnvironmentObject var scores: Scale_scores
    
    
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
                    NavigationLink(destination: Landmark_Publications())
                    {Text("Landmark Publications")
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
                    NavigationLink(destination: Comorbidity_Guides())
                    {Text("Comorbidity Guides")
                        .fontWeight(.thin)
                        .font(.body)
                        .foregroundColor(.blue)}
                }.frame(height: 60)
                
                HStack {
                    NavigationLink(destination: Articles())
                    {Text("Featured Publications")
                        .fontWeight(.thin)
                        .font(.body)
                        .foregroundColor(.blue)}
                }.frame(height: 60)
                
                HStack {
                    NavigationLink(destination: MedicationsView())
                    {Text("Medications")
                        .fontWeight(.thin)
                        .font(.body)
                        .foregroundColor(.blue)}
                }.frame(height: 60)
                
                HStack {
                    NavigationLink(destination: Text("Local Resources Listed Here"))
                    {Text("Local Resources")
                        .fontWeight(.thin)
                        .font(.body)
                        .foregroundColor(.blue)}
                }.frame(height: 60)
                
                HStack {
                    NavigationLink(destination: Text("Primary Care Resources Here"))
                    {Text("Primary Care Guide")
                        .fontWeight(.thin)
                        .font(.body)
                        .foregroundColor(.blue)}
                }.frame(height: 60)
                
                HStack {
                    NavigationLink(destination: DSMVview())
                    {Text("DSM V Criteria")
                        .fontWeight(.thin)
                        .font(.body)
                        .foregroundColor(.blue)}
                }.frame(height: 60)
                
            }
            .background(Color(red: 050/255, green: 130/255, blue: 160/255))
            .navigationBarTitle("Psych Station", displayMode: .inline)
        }
        
        
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
        //
        //
        
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView().environmentObject(Scale_scores())
    }
}

// comment for testing
