//
//  Phq9MailView.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/7/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//
import SwiftUI
import UIKit
import MessageUI

struct Phq9MailView: UIViewControllerRepresentable {
    
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

//    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
//        let vc = MFMailComposeViewController()
//        vc.mailComposeDelegate = context.coordinator
//        return vc
//    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<Phq9MailView>) {

    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Phq9MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
            let dateCurrent = Date()
            let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US")
                formatter.timeStyle = .short
                formatter.dateStyle = .medium
                formatter.dateFormat = "MMMM d, yyyy 'at' h:mm a"
                formatter.amSymbol = "AM"
                formatter.pmSymbol = "PM"
        vc.setSubject("Phq-9 Result")
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
                        <tr><td> \(self.scores.phq9_array[0]) </td><td>Little interest or pleasure in doing things</td></tr>
                        
                        <tr><td> \(self.scores.phq9_array[1]) </td><td> Feeling down, depressed, or hopeless</td></tr>
                        
                        <tr><td> \(self.scores.phq9_array[2]) </td><td> Trouble falling or staying asleep, or sleeping too much</td></tr>
                        
                        <tr><td> \(self.scores.phq9_array[3]) </td><td>Feeling tired or having little energy</td></tr>
                        
                        <tr><td> \(self.scores.phq9_array[4]) </td><td>Poor appetite or overeating</td></tr>
                        
                        <tr><td> \(self.scores.phq9_array[5]) </td><td>Feeling bad about yourself or that you are a failure or have let yourself or your family down</td></tr>
                        
                        <tr><td> \(self.scores.phq9_array[6]) </td><td>Trouble concentrating on things, such as reading the newspaper or watching television</td></tr>
                        
                        <tr><td> \(self.scores.phq9_array[7]) </td><td>Moving or speaking so slowly that other people could have noticed. Or the opposite being so figety or restless that you have been moving around a lot more than usual</td></tr>
                        
                        <tr><td> \(self.scores.phq9_array[8]) </td><td>Thoughts that you would be better off dead, or of hurting yourself</td></tr>
                        
            <tr><td> \(self.scores.phq9_q10) </td><td>If you checked off any problems, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?</td></tr>
                        
                    </table>
                </body>
            </html>
            """, isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
}
