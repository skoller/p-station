//
//  PKCanvasRepresentation.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/15/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import PencilKit
import UIKit

struct PKCanvasRepresentation : UIViewRepresentable {
    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
//        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.isOpaque = false
        canvasView.backgroundColor = .clear
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
    
   
    
    
}


struct PKCanvasRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        PKCanvasRepresentation()
    }
}
