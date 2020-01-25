//
//  FloatingMenu.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/29/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct FloatingMenu: View {
    
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    
    
    var body: some View {
        VStack {
            Spacer()
            
              if showMenuItem1 {
                  MenuItem(icon: "camera.fill")
              }
              if showMenuItem2 {
                  MenuItem(icon: "photo.on.rectangle")
              }
              if showMenuItem3 {
                  MenuItem(icon: "square.and.arrow.up.fill")
              }
            
            
            Button(action: {
                self.showMenu()
                })
                { Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color(red: 050/255, green: 100/255, blue: 200/255))
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                    
            }
        }
    }
    
    func showMenu() {
       withAnimation {
            showMenuItem3.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            withAnimation {
                self.showMenuItem2.toggle()
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            withAnimation {
                self.showMenuItem1.toggle()
            }
        })
    }
    
}

struct MenuItem: View {
    
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 050/255, green: 100/255, blue: 200/255))
                .frame(width: 40, height: 40)
            
            Image(systemName: icon)
                .imageScale(.small)
                .foregroundColor(.white)
        }
        .frame(width: 25, height: 45)
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        .transition(.move(edge: .trailing ))
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}
