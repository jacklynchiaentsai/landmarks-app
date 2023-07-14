//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/14/23.
//

import SwiftUI

struct FavoriteButton: View {
    // using binding: changes made inside this view propagate back to the data source
    @Binding var isSet: Bool
    var body: some View {
        Button {
            // toggles the isSet state
            isSet.toggle()
        } label:{
            // changes appearance based on the state
            Label("Toggle Favorite", systemImage: isSet ? "star.fill": "star")
            // icon only the title string for button label won'd appear on UI but helpful for voice over
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow: .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
