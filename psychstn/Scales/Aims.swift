//
//  Aims.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/29/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct Aims: View {
    @EnvironmentObject var scores: Scale_scores
    @EnvironmentObject var settings: UserSettings
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
//    @State var pt_id: String = ""
    
//    @State private var showModal = false
    
    
    
    var body: some View {
      
        VStack {
            
            Divider()
            
            Text("Total Score: \(self.scores.aims_array.reduce(0, +))").font(.body).bold()

VStack{
            HStack {
//                    TextField("Patient ID", text: $pt_id)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .fixedSize().frame(width: 100, height: 35)
                    Button(action: { self.isShowingMailView.toggle()}) {
                        Text("Email Result")
                        Image(systemName: "paperplane").imageScale(.large)
                            
                    }
                    .onTapGesture {MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()}
                    .sheet(isPresented: $isShowingMailView) {AimsMailView(result: self.$result).environmentObject(self.scores)}
                    .alert(isPresented: self.$alertNoMail) {Alert(title: Text("NO MAIL APPLICATION CURRENTLY SETUP"))}
                
            }
            

        
            
            Divider()
            
            Text("Question Key:").font(.caption)
            Text("0 = None, 1 = Minimum, 2 = Mild, 3 = Moderate, 4 = Severe").font(.caption)
            
            Divider()
    
       }.modifier(DismissingKeyboard())
         
            List {
                Aims_quant_row()
                Aims_qual_row()
            }
           
            
        }
        .navigationBarTitle("Abnormal Involuntary Movement Scale (AIMS)", displayMode: .inline)
        
    }
}

struct Aims_questions: Codable, Identifiable {
    var id: Int
    var q: String
}

struct Aims_qual_questions: Codable, Identifiable {
    var id: Int
    var q: String
}

struct Aims_Previews: PreviewProvider {
    static var previews: some View {
        Aims().environmentObject(Scale_scores())
    }
}




