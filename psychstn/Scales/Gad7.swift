
//  Gad7.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/8/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.


import SwiftUI
import UIKit
import MessageUI

struct Gad7: View {

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
                    Text("Total Score: \(self.scores.gad7_array.reduce(0, +))").font(.title).bold().padding(5)
                    .alignmentGuide(.leading) { d in d[.leading] }
                    Text(" \(gad7_screen_result(ans: self.scores.gad7_array.reduce(0, +)))")
                                               .font(.body).bold()
                                               .foregroundColor(Color.green)
                    }
                    
                    Spacer()
                                           
                                           Button(action: { self.isShowingMailView.toggle()}) {
                                            Image(systemName: "paperplane").imageScale(.large)
                                            Text("Email Result ")
                                           }.padding(5).addBorder(Color.gray, width: 1, cornerRadius: 15).padding(3)
                                           .onTapGesture {MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()}
                                           .sheet(isPresented: $isShowingMailView) {Gad7MailView(result: self.$result).environmentObject(self.scores)}
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
                    Gad7_row()
                    Gad7_row_finalQual()
                }
               
            }.navigationBarTitle("GAD-7", displayMode: .inline)
        .navigationBarItems(trailing:
        Button("Clear") {
            let a = self.scores.gad7_array
            let z = a.map { reset_to_zero(in: $0)}
            self.scores.gad7_array = z
        })
    }
}


func gad7_screen_result(ans: Int) -> String {
    switch ans {
        case 0:
            return ""
        case 1:
            return ""
        case 2:
            return ""
        case 3:
            return ""
        case 4:
            return ""
        case 5:
            return "Mild Anxiety"
        case 6:
            return "Mild Anxiety"
        case 7:
            return "Mild Anxiety"
        case 8:
            return "Mild Anxiety"
        case 9:
            return "Mild Anxiety"
        case 10:
            return "Moderate Anxiety"
        case 11:
            return "Moderate Anxiety"
        case 12:
            return "Moderate Anxiety"
        case 13:
            return "Moderate Anxiety"
        case 14:
            return "Moderate Anxiety"
        case 15:
            return "Severe Anxiety"
        case 16:
            return "Severe Anxiety"
        case 17:
            return "Severe Anxiety"
        case 18:
            return "Severe Anxiety"
        case 19:
            return "Severe Anxiety"
        case 20:
            return "Severe Anxiety"
        case 21:
            return "Severe Anxiety"
        default:
            return "Error"
    }
}

struct Gad7_Previews: PreviewProvider {
    static var previews: some View {
            Gad7().environmentObject(Scale_scores())
    }
    
}
