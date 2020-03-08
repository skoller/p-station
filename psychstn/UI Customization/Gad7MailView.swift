//
//  Gad7MailView.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/8/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct Gad7MailView: UIViewControllerRepresentable {
    
    @EnvironmentObject var scores: Scale_scores

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    

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
                                context: UIViewControllerRepresentableContext<Gad7MailView>) {

    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Gad7MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
            let dateCurrent = Date()
            let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US")
                formatter.timeStyle = .short
                formatter.dateStyle = .medium
                formatter.dateFormat = "MMMM d, yyyy 'at' h:mm a"
                formatter.amSymbol = "AM"
                formatter.pmSymbol = "PM"
        vc.setSubject("Gad-7 Result")
        vc.setToRecipients([""])
        vc.setMessageBody(
            """
            <html>
                <head>
                    <style> table, th, td {border: 1px solid black;}</style>
                </head>
            
                <body>
                    <h2>Phq9 Total Score: \(self.scores.phq9_array.reduce(0, +))</h2>
            <h2>Patient ID: </h2>
            <h3>\(formatter.string(from: dateCurrent))</h3>
                
                    <table><tr><th>Item Score</th><th>Item</th></tr>
                        <tr><td> \(self.scores.gad7_array[0]) </td><td>Feeling nervous, anxious, or on edge</td></tr>
                        
                        <tr><td> \(self.scores.gad7_array[1]) </td><td>Not being able to stop or control worrying</td></tr>
                        
                        <tr><td> \(self.scores.gad7_array[2]) </td><td>Worrying too much about different things</td></tr>
                        
                        <tr><td> \(self.scores.gad7_array[3]) </td><td>Trouble relaxing</td></tr>
                        
                        <tr><td> \(self.scores.gad7_array[4]) </td><td>Being so restless that it's hard to sit still</td></tr>
                        
                        <tr><td> \(self.scores.gad7_array[5]) </td><td>Becoming easily annoyed or irritable</td></tr>
                        
                        <tr><td> \(self.scores.gad7_array[6]) </td><td>Feeling afraid as if something awful might
                        happen</td></tr>
                        
            <tr><td> </td><td>If you checked off any problems, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?</td></tr>
                        
                    </table>
                </body>
            </html>
            """, isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
}
