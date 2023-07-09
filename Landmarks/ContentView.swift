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
 */
//

import SwiftUI

// first structure describes the view's content and layout
struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Turtle Rock")
                .font(.title)
                .foregroundColor(.black)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding() // provide bounds space for vstack
    }
}

// second structure declares a preview for the view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
