//
//  DrawView.swift
//  psychstn
//
//  Created by Nathan Skoller on 3/15/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI
import PencilKit
import UIKit

struct TrailsView: View {
    var body: some View {
                ZStack {
                    Image("moca_trails_img")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    PKCanvasRepresentation()
                }
        
    }
}



struct TrailsView_Previews: PreviewProvider {
    static var previews: some View {
        TrailsView()
    }
}

