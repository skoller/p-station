//
//  Phq9.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/7/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct Phq9: View {
    
       @EnvironmentObject var scores: Scale_scores
       @EnvironmentObject var settings: UserSettings
       @State private var result: Result<MFMailComposeResult, Error>? = nil
       @State private var isShowingMailView = false
       @State private var alertNoMail = false
    
    
    var body: some View {
        VStack {
            
            Divider()
            
            Text("Total Score: \(self.scores.phq9_array.reduce(0, +))").font(.body).bold()
            
            VStack{
                HStack {
                 
                    Button(action: { self.isShowingMailView.toggle()}) {
                        Text("Email Result")
                        Image(systemName: "paperplane").imageScale(.large)
                        
                    }
                    .onTapGesture {MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()}
                    .sheet(isPresented: $isShowingMailView) {Phq9MailView(result: self.$result).environmentObject(self.scores)}
                    .alert(isPresented: self.$alertNoMail) {Alert(title: Text("NO MAIL APPLICATION CURRENTLY SETUP"))}
                    
                }
                
                
                
                
                Divider()
                VStack(alignment: .leading) {
                Text("Question Key:").font(.caption)
                Text("0 = Not At All").font(.caption)
                Text("1 = Several Days").font(.caption)
                Text("2 = More than Half the Days").font(.caption)
                Text("3 = Nearly Every Day").font(.caption)
                }
                
                Divider()
                
            }.modifier(DismissingKeyboard())
            
            List {
              Phq9_row()
              Phq9_row_finalQual()
            }
            
            
        }
        .navigationBarTitle("PHQ9", displayMode: .inline)
        
    }
}

struct Phq9_Previews: PreviewProvider {
    static var previews: some View {
        Phq9().environmentObject(Scale_scores())
    }
}
