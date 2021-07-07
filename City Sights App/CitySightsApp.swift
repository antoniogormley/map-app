//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by Antonio Gormley on 07/07/2021.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
