//
//  BfcrsMailView.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/8/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct BfcrsMailView: UIViewControllerRepresentable {
    
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
                                context: UIViewControllerRepresentableContext<BfcrsMailView>) {
        
    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<BfcrsMailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        let dateCurrent = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        formatter.dateFormat = "MMMM d, yyyy 'at' h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        vc.setSubject("BFCRS Result")
        vc.setToRecipients([""])
        vc.setMessageBody(
        """
        <html>
                <head>
                    <style> table, th, td {border: 1px solid black;}</style>
                </head>
            
            <body>
                <h2>BFCRS Total Score: \(self.scores.bfcrs_array.reduce(0, +))</h2>
                <h2>Patient ID: </h2>
                <h3>\(formatter.string(from: dateCurrent))</h3>
            
                <table><tr><th>Item Score</th><th>Item</th></tr>
                    <tr><td> \(self.scores.bfcrs_array[0]) </td><td>Feeling nervous, anxious, or on edge</td></tr>
            
                    <tr><td> \(self.scores.bfcrs_array[1]) </td><td>Not being able to stop or control worrying</td></tr>
            
                    <tr><td> \(self.scores.bfcrs_array[2]) </td><td>Worrying too much about different things</td></tr>
            
                    <tr><td> \(self.scores.bfcrs_array[3]) </td><td>Trouble relaxing</td></tr>
            
                    <tr><td> \(self.scores.bfcrs_array[4]) </td><td>Being so restless that it's hard to sit still</td></tr>
            
                    <tr><td> \(self.scores.bfcrs_array[5]) </td><td>Becoming easily annoyed or irritable</td></tr>
            
                    <tr><td> \(self.scores.bfcrs_array[6]) </td><td>Feeling afraid as if something awful might happen</td></tr>
            
                    <tr><td> \(self.scores.bfcrs_array[7]) </td><td>Feeling nervous, anxious, or on edge</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[8]) </td><td>Not being able to stop or control worrying</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[9]) </td><td>Worrying too much about different things</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[10]) </td><td>Trouble relaxing</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[11]) </td><td>Being so restless that it's hard to sit still</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[12]) </td><td>Becoming easily annoyed or irritable</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[13]) </td><td>Feeling afraid as if something awful might happen</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[14]) </td><td>Feeling nervous, anxious, or on edge</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[15]) </td><td>Not being able to stop or control worrying</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[16]) </td><td>Worrying too much about different things</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[17]) </td><td>Trouble relaxing</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[18]) </td><td>Being so restless that it's hard to sit still</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[19]) </td><td>Becoming easily annoyed or irritable</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[20]) </td><td>Feeling afraid as if something awful might happen</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[21]) </td><td>Becoming easily annoyed or irritable</td></tr>
                
                    <tr><td> \(self.scores.bfcrs_array[22]) </td><td>Feeling afraid as if something awful might happen</td></tr>
            
                </table>
            </body>
        </html>
        """, isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
}
