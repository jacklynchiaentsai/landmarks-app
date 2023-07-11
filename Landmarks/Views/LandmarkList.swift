//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/9/23.
//
/*
 - lists work with identifiable data
 1) passing along with data a key path to a property that uniquely identifies each element
 2) conform data type to Identifiable protocol
 - set navigation capacbilities to a list by embedding it in a NavifationView, and then nesting each row in a NavigationLink
 - when the elements of array are simple value types use \.self as key path to the identifier
 */

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List (landmarks){ landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
                
            }
            // setting the title of the navigation bar when displaying the list
            .navigationTitle("Landmarks")
            
        }

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone XS Max","iPad Pro (12.9-inch) (6th generation)"], id: \.self) { deviceName in
            LandmarkList()
            // changing preview to render at different size
                .previewDevice(PreviewDevice(rawValue: deviceName))
                // add device name as labels for the previews
                .previewDisplayName(deviceName)
        }
    }
}
