//
//  Bfcrs.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/8/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct Bfcrs: View {

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
                        Text("Total Score: \(self.scores.bfcrs_array.reduce(0, +))").font(.title).bold().padding(5)
                            .alignmentGuide(.leading) { d in d[.leading] }
                   
                    }

                    Spacer()

                       Button(action: { self.isShowingMailView.toggle()}) {
                        Image(systemName: "paperplane").imageScale(.large)
                        Text("Email Result ")
                       }.padding(5).addBorder(Color.gray, width: 1, cornerRadius: 15).padding(3)
                       .onTapGesture {MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()}
                       .sheet(isPresented: $isShowingMailView) {BfcrsMailView(result: self.$result).environmentObject(self.scores)}
                       .alert(isPresented: self.$alertNoMail) {Alert(title: Text("NO MAIL APPLICATION CURRENTLY SETUP"))}



                }

                List {
                    Bfcrs_row()
                }  

            }.navigationBarTitle("BFCRS", displayMode: .inline)
        .navigationBarItems(trailing:
        Button("Clear") {
            let a = self.scores.bfcrs_array
            let z = a.map { reset_to_zero(in: $0)}
            self.scores.bfcrs_array = z
        })
    }
}




struct Bfcrs_Previews: PreviewProvider {
    static var previews: some View {
            Bfcrs().environmentObject(Scale_scores())
    }

}

