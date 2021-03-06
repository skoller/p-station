//
//  SceneDelegate.swift
//  psychstn
//
//  Created by Nathan Skoller on 12/16/19.
//  Copyright © 2019 Nathan Skoller. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation
import PencilKit


class UserSettings: ObservableObject {
    @Published var favorites = []
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
}

class Scale_scores: ObservableObject {
    @Published var aims_score = 0
    @Published var aims_array = [0,0,0,0,0,0,0,0,0,0]
    @Published var aims_qual_array = [false, false, false, false]
    @Published var asrs_array = [0,0,0,0,0,0]
    @Published var phq9_array = [0,0,0,0,0,0,0,0,0]
    @Published var phq9_q10 = ""
    @Published var gad7_array = [0,0,0,0,0,0,0]
    @Published var gad7_q8 = ""
    @Published var bfcrs_array = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
}

class PatientCensus: ObservableObject {
    @Published var patients = [""]
}



extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        return overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: width))
    }
}

extension PKCanvasView{
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return DragOrDraw.disableDrawing
    }
}

class DragOrDraw{
    static var disableDrawing = true
}
//
//struct Constants {
//    static let dsm = Bundle.main.decode([DsmCategory].self, from: "dsm.json")
//}



public struct ListSeparatorStyleNoneModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorStyle = .none
        }.onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

extension View {
    public func listSeparatorStyleNone() -> some View {
        modifier(ListSeparatorStyleNoneModifier())
    }
}



class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var settings = UserSettings()
    var scores = Scale_scores()
    var patient_census = PatientCensus()
  
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Get the managed object context from the shared persistent container.
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        let tabsView = TabsView().environment(\.managedObjectContext, context)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: tabsView
                .environmentObject(settings)
                .environmentObject(scores)
                .environmentObject(patient_census))
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

