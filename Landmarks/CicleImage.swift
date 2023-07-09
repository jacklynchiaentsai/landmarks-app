//
//  CicleImage.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/9/23.
//
/*
 App learning tips
 - image name use @2x to signify
 */

import SwiftUI

struct CicleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay{ // giving image border
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CicleImage_Previews: PreviewProvider {
    static var previews: some View {
        CicleImage()
    }
}
