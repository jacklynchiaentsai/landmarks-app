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
 */
//

import SwiftUI

// first structure describes the view's content and layout
struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                .ignoresSafeArea(edges: .top) // allow map content to extend to the top edge of the screen
            CircleImage()
                .offset(y: -130) // layer over map view
                .padding(.bottom, -130)
            VStack (alignment: .leading){
                Text("Turtle Rock")
                    .font(.title)
                    .foregroundColor(.black)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("This massive formation is located across from the parking lot from the entrance into Real Hidden Valley area in Joshua Tree National Park.")
            }
            .padding()
            Spacer() // push content to the top of the screen
        } // provide bounds space for vstack
    }
}

// second structure declares a preview for the view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
