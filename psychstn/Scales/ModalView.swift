//
//  ModalView.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/7/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

//import SwiftUI
//import UIKit
//import MessageUI
//
//struct ModalView: View {
//    @EnvironmentObject var scores: Scale_scores
//    @Binding var showModal: Bool
//    @State var result: Result<MFMailComposeResult, Error>? = nil
//    @State var isShowingMailView = false
//    @State var alertNoMail = false
////    @State var pt_id = ""
//       
//    
//    var body: some View {
//         VStack {
//                          Text("Inside Modal View")
//                              .padding()
////                           TextField("Patient ID", text: $pt_id)
////                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                            Button("Dismiss") {
//                              self.showModal.toggle()
//                          }
//            
//            
//            Button(action: { self.isShowingMailView.toggle()}) {
//                    Image(systemName: "envelope").imageScale(.large)
//                HStack {
//                    Text("Email Result")
//                }
//                    
//                }
//                .onTapGesture {MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()}
//                .sheet(isPresented: $isShowingMailView) {AimsMailView(result: self.$result).environmentObject(self.scores)}
//                .alert(isPresented: self.$alertNoMail) {Alert(title: Text("NO MAIL APPLICATION CURRENTLY SETUP"))}
//            
//         }.modifier(DismissingKeyboard())
//        
//        
//    }
//}
//
//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView(showModal: .constant(true))
//    }
//}
