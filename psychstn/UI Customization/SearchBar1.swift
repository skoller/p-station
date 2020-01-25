//
//  SearchBar1.swift
//  psychstn
//
//  Created by Nathan Skoller on 1/24/20.
//  Copyright © 2020 Nathan Skoller. All rights reserved.
//

import SwiftUI

struct SearchBar1: View {
    var body: some View {
        CustomUIViewControllerRepresentation()
    }
}

struct CustomUIViewControllerRepresentation: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController

    func makeUIViewController(context: Context) -> UINavigationController {
        let viewController = UIHostingController(rootView: ToolsView())

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true

        let searchController = UISearchController()
        navigationController.navigationItem.searchController = searchController
        
        viewController.navigationItem.searchController = searchController

        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {

    }
}


    

