//
//  HulluPizzaApp.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 29/11/20.
//

import SwiftUI

@main
struct HulluPizzaApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(UserPreferences())
        }
    }
}
