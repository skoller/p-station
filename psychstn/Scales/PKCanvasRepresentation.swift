//
//  PKCanvasRepresentation.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/15/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import PencilKit

struct PKCanvasRepresentation : UIViewRepresentable {
    func makeUIView(context: Context) -> PKCanvasView {
        return PKCanvasView();
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
}
