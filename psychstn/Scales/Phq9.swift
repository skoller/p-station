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
            VStack {
                HStack(alignment: .center) {
                    VStack {
                    Text("Total Score: \(self.scores.phq9_array.reduce(0, +))")
                        .font(.title).bold().padding(5)
                    .alignmentGuide(.leading) { d in d[.leading] }
                    Text(" \(screen_result(ans: self.scores.phq9_array.reduce(0, +)))")
                                               .font(.body).bold()
                                               .foregroundColor(Color.green)
                    }
                    
                    Spacer()
                                           
                                           Button(action: { self.isShowingMailView.toggle()}) {
                                            Image(systemName: "paperplane").imageScale(.large)
                                            Text("Email Result ")
                                           }.padding(5).addBorder(Color.gray, width: 1, cornerRadius: 15).padding(3)
                                           .onTapGesture {MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()}
                                           .sheet(isPresented: $isShowingMailView) {Phq9MailView(result: self.$result).environmentObject(self.scores)}
                                           .alert(isPresented: self.$alertNoMail) {Alert(title: Text("NO MAIL APPLICATION CURRENTLY SETUP"))}
                                           
                   
                    
                    }
                   
               
                VStack {
                    
                    
                    Divider()
                    HStack {
                        Text("Question Key: ").font(.body)
                        VStack(alignment: .leading) {
                           
                            Text("0 = Not At All").font(.body)
                            Text("1 = Several Days").font(.body)
                            Text("2 = More than Half the Days").font(.body)
                            Text("3 = Nearly Every Day").font(.body)
                        }
                    }
                    
                    Divider()
                    
                }.modifier(DismissingKeyboard())
                
                ScrollView {
                    Phq9_row()
                    Phq9_row_finalQual()
                }
               
            }.navigationBarTitle("PHQ9", displayMode: .inline)
        .navigationBarItems(trailing:
        Button("Clear") {
            let a = self.scores.phq9_array
            let z = a.map { reset_to_zero(in: $0)}
            self.scores.phq9_array = z
            self.scores.phq9_q10 = ""
        })
    }
}


func reset_to_zero(in: Int) -> Int {
    return 0
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
