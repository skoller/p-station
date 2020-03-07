//
//  SettingsView.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/7/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    
    var body: some View {
       NavigationView {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                        Text("First Name: \(self.settings.firstName)")
                        Text("Last Name:\(self.settings.lastName)")
                        Text("Email: \(self.settings.email)")
                }.padding().addBorder(Color.gray, width: 2, cornerRadius: 10).padding(5)
                }
        
        Divider()
            VStack {
                TextField("First Name", text: self.$settings.firstName)  .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last Name", text: self.$settings.lastName)  .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: self.$settings.email)  .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding().addBorder(Color.gray, width: 2, cornerRadius: 10).padding(5)
        }.scaledToFill()
         .modifier(DismissingKeyboard())
        .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
   
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
