//
//  MailView.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/8/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct AsrsMailView: UIViewControllerRepresentable {
    
    @EnvironmentObject var scores: Scale_scores

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
//    @Binding var pt_id: String
    

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }


    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<AsrsMailView>) {

    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AsrsMailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
            let dateCurrent = Date()
            let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US")
                formatter.timeStyle = .short
                formatter.dateStyle = .medium
                formatter.dateFormat = "MMMM d, yyyy 'at' h:mm a"
                formatter.amSymbol = "AM"
                formatter.pmSymbol = "PM"
        vc.setSubject("ASRS Result")
        vc.setToRecipients([""])
        vc.setMessageBody(
            """
            <html>
                           <head>
                               <style> table, th, td {border: 1px solid black;}</style>
                           </head>
                       
                       <body>
                           <h2>BFCRS Total Score: \(self.scores.asrs_array.reduce(0, +))</h2>
                           <h2>Patient ID: </h2>
                           <h3>\(formatter.string(from: dateCurrent))</h3>
                       
                           <table><tr><th>Item Score</th><th>Item</th></tr>
            
                               <tr><td> \(self.scores.asrs_array[0]) </td><td>How often do you have trouble wrapping up the final details of a project,
                               once the challenging parts have been done?</td></tr>
                       
                               <tr><td> \(self.scores.asrs_array[1]) </td><td>How often do you have difficulty getting things in order when you have to do
                               a task that requires organization?</td></tr>
                       
                               <tr><td> \(self.scores.asrs_array[2]) </td><td>How often do you have problems remembering appointments or obligations?</td></tr>
                       
                               <tr><td> \(self.scores.asrs_array[3]) </td><td>When you have a task that requires a lot of thought, how often do you avoid
                               or delay getting started?</td></tr>
                       
                               <tr><td> \(self.scores.asrs_array[4]) </td><td>How often do you fidget or squirm with your hands or feet when you have
                               to sit down for a long time?</td></tr>
            
                               <tr><td> \(self.scores.asrs_array[5]) </td><td>How often do you feel overly active and compelled to do things, like you were driven by a motor?</td></tr>
                       
                           </table>
                       </body>
                   </html>
            """, isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
}
