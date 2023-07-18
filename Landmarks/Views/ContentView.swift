//
//  ContentView.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/9/23.
// default SwiftUI View files declare two structures

/*
 App learning tips:
 - command click to bring up editing popover
 - modifiers wrap a view and returns a new view
 - implementation: chain multiple modifiers, stacked vertically
 - embed multiple views in stacks
    -> by default stacks center their contents along their axis
 - spaced expands to make its containing view use all of the space of its parent view
 - can move shared features of the same stack as a modifier of the stack
 - using .json files to store data to dynamically populate views
 - when calling a view need to pass in the properties in ()
 */
//

import SwiftUI

// first structure describes the view's content and layout
struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab{
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection){
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tag(Tab.list)
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

// second structure declares a preview for the view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // add model object to the environment, making the object available for any subview
        ContentView()
            .environmentObject(ModelData())
    }
}
