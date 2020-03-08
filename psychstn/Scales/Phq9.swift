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
       @State private var def: Bool = false
    
    
    
    
    
    var body: some View {
        
    VStack{
                Divider()
                Text("Total Score: \(self.scores.phq9_array.reduce(0, +))").font(.headline).bold()
                Text(" \(screen_result(ans: self.scores.phq9_array.reduce(0, +)))").font(.body).bold().foregroundColor(Color.green)
            
            VStack {
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
                Text("Question Key:").font(.footnote)
                Text("0 = Not At All").font(.footnote)
                Text("1 = Several Days").font(.footnote)
                Text("2 = More than Half the Days").font(.footnote)
                Text("3 = Nearly Every Day").font(.footnote)
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

func screen_result(ans: Int) -> String {
    switch ans {
    case 0:
        return ""
    case 1:
        return "Minimal Depression"
    case 2:
        return "Minimal Depression"
    case 3:
        return "Minimal Depression"
    case 4:
        return "Minimal Depression"
    case 5:
        return "Mild Depression"
    case 6:
       return "Mild Depression"
    case 7:
        return "Mild Depression"
    case 8:
        return "Mild Depression"
    case 9:
        return "Mild Depression"
    case 10:
        return "Moderate Depression"
    case 11:
        return "Moderate Depression"
    case 12:
        return "Moderate Depression"
    case 13:
        return "Moderate Depression"
    case 14:
        return "Moderate Depression"
    case 15:
        return "Moderately Severe Depression"
    case 16:
        return "Moderately Severe Depression"
    case 17:
        return "Moderately Severe Depression"
    case 18:
        return "Moderately Severe Depression"
    case 19:
        return "Moderately Severe Depression"
    case 20:
        return "Severe Depression"
    case 21:
        return "Severe Depression"
    case 22:
        return "Severe Depression"
    case 23:
        return "Severe Depression"
    case 24:
        return "Severe Depression"
    case 25:
        return "Severe Depression"
    case 26:
        return "Severe Depression"
    case 27:
        return "Severe Depression"
    default:
        return "Error"
    }
}

struct Phq9_Previews: PreviewProvider {
    static var previews: some View {
        Phq9().environmentObject(Scale_scores())
    }
}
