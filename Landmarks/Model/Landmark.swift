//
//  Landmark.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/9/23.
//

import Foundation
import SwiftUI
import CoreLocation

// define landmark structure with properties matching names of keys in the .json file
// codable: makes easier to move data between structure and data file
struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String //read image name from data
    // image property that loads image from asset
    var image: Image{
        Image(imageName)
    }
    
    // using the nested Coordinates type
    // private because we're just using it to create a public computed property
    private var coordinates: Coordinates
    // property that;s useful for interacting with Mapkit
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}
