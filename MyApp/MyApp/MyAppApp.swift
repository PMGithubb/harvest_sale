//
//  MyAppApp.swift
//  MyApp
//
//  Created by CoopStudent on 7/13/22.
//

import SwiftUI

@main
struct MyAppApp: App {
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabBarView()
                    .foregroundColor(.textBrown)
            }
        }
    }
}
