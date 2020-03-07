//
//  SwiftUIView.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/6/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//
import SwiftUI
import UIKit
import MessageUI

struct AimsMailView: UIViewControllerRepresentable {
    
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

//    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
//        let vc = MFMailComposeViewController()
//        vc.mailComposeDelegate = context.coordinator
//        return vc
//    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<AimsMailView>) {

    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AimsMailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(["nskoller@gmail.com"])
        vc.setMessageBody(
            """
            <html>
                <head>
                    <style> table, th, td {border: 1px solid black;}</style>
                </head>
            
                <body>
                    <h2>AIMS Total Score: \(self.scores.aims_array.reduce(0, +))</h2>
                    <h2>Patient ID: </h2>
                
                    <table><tr><th>Item Score</th><th>Question</th></tr>
                        <tr><td> \(self.scores.aims_array[0]) </td><td>Muscles of Facial Expression: e.g. movements of forehead, eyebrows, periorbital area, cheeks, including frowning, blinking, smiling, grimacing</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[1]) </td><td>Lips and Perioral Area: e.g. puckering, pouting, smacking</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[2]) </td><td>Jaw: Biting, clenching, chewing, mouth opening , lateral movement</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[3]) </td><td>Tongue: Rate only increases in movement both in and out of mouth. NOT inability to sustain movement. Darting in and out of mouth</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[4]) </td><td>Upper (arms, wrists, hands, fingers): Include choreic movements (i.e. rapid objectively purposeless, irregular, spontaneous) athetoid movements. DO NOT INCLUDE TREMOR (i.e. repetitive, regular, rhythmic)</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[5]) </td><td>Lower (legs, knees, ankles, toes): Lateral knee movement, foot tapping, heel dropping, foot squirming, inversion and eversion of foot</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[6]) </td><td>Neck, shoulders and hips: Rocking, twisting, squirming, pelvic gyrations</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[7]) </td><td>Severity of abnormal movements overall</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[8]) </td><td>Incapacitation due to abnormal movements</td></tr>
                        
                        <tr><td> \(self.scores.aims_array[9]) </td><td>Patient’s awareness of abnormal movements. Rate only patients report: No Awareness = 0, Aware, no distress = 1, Aware, mild distress = 2, Aware, moderate distress = 3, Aware, severe distress = 4</td></tr>
                        
                        <tr><td> \(self.scores.aims_qual_array[0]) </td><td>Current problems with teeth and/or dentures</td></tr>
                        
                        <tr><td> \(self.scores.aims_qual_array[1]) </td><td>Are dentures usually worn?</td></tr>
                        
                        <tr><td> \(self.scores.aims_qual_array[2]) </td><td>Endentia?</td></tr>
                        
                        <tr><td> \(self.scores.aims_qual_array[3]) </td><td>Do movements disappear with sleep?</td></tr>
                    </table>
                </body>
            </html>
            """, isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
}
