//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/9/23.
//

import SwiftUI

// main identifies app's entry point
@main
struct LandmarksApp: App { // structure that conforms to the App protocol
    // @StateObject attribute to initialize a model object only once during the life time of the app
    @StateObject private var modelData = ModelData()
    // structure's body property returns one or more scneces for display
    var body: some Scene {
        WindowGroup {
            ContentView()
            // supply modelData to content view
                .environmentObject(modelData)
        }
    }
}
