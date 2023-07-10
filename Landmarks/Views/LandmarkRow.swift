//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/9/23.
//
/*
 App learning tips
 - A preview provider returns one or more views
 - Use a group to return multiple previews from a preview provider
 - group is a container for grouping view content
 - the code you write in preview provider only changes what XCode displays in the canvas
 */
import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height:50)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // LandmarkRow ntype needs a landmark instnace during initialization
        Group{
            LandmarkRow(landmark: landmarks[0]) // specifying first element of landmarks array
            LandmarkRow(landmark: landmarks[1])
                
                
        }
        // set a size that approximates a row in a list
        .previewLayout(.fixed(width: 300, height: 70))
        
        
    }
}
