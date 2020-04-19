//
//  asrs_array.swift
//  psychstn
//
//  Created by Nathan Skoller on 2/10/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct Asrs: View {

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
                    Text("Total Score: \(self.scores.asrs_array.reduce(0, +))").font(.title).bold().padding(5)
                    .alignmentGuide(.leading) { d in d[.leading] }
                    Text(" \(asrs_screen_result(ans: self.scores.asrs_array.reduce(0, +)))")
                                               .font(.body).bold()
                                               .foregroundColor(Color.green)
                    }
                    
                    Spacer()
                                           
                                           Button(action: { self.isShowingMailView.toggle()}) {
                                            Image(systemName: "paperplane").imageScale(.large)
                                            Text("Email Result ")
                                           }.padding(5).addBorder(Color.gray, width: 1, cornerRadius: 15).padding(3)
                                           .onTapGesture {MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()}
                                           .sheet(isPresented: $isShowingMailView) {AsrsMailView(result: self.$result).environmentObject(self.scores)}
                                           .alert(isPresented: self.$alertNoMail) {Alert(title: Text("NO MAIL APPLICATION CURRENTLY SETUP"))}
                                           
                   
                    
                    }
                   
               
                VStack {
                    
                    
                    Divider()
                    HStack {
                         Text("Question Key: ").font(.body)
                    VStack(alignment: .leading) {
                       
                        Text("0 = Never").font(.body)
                        Text("1 = Rarely").font(.body)
                        Text("2 = Sometimes").font(.body)
                        Text("3 = Often").font(.body)
                        Text("4 = Very Often").font(.body)
                    }
                    }
                    
                    Divider()
                    
                }.modifier(DismissingKeyboard())
                
               ScrollView {
                    Asrs_row()
                    
                }
               
            }.navigationBarTitle("GAD-7", displayMode: .inline)
        .navigationBarItems(trailing:
        Button("Clear") {
            let a = self.scores.asrs_array
            let z = a.map { reset_to_zero(in: $0)}
            self.scores.asrs_array = z
        })
    }
}


func asrs_screen_result(ans: Int) -> Int {
    return 0
}

struct Asrs_Previews: PreviewProvider {
    static var previews: some View {
            Asrs().environmentObject(Scale_scores())
    }
    
}

