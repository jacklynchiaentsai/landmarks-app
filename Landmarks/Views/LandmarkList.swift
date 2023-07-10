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
 */

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List (landmarks){ landmark in
            LandmarkRow(landmark: landmark)
            
        }

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
