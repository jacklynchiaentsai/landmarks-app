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
// codable: read the value associated with the key by creating a new property with the same name as the key
// the landmark data has the id property required by the Identifiable protocol
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool // already exists in the data
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        case arts = "Arts / Performances"
        case food = "Foods"
        case sites = "Sites"
        case entertainment = "Entertainment"
    }
    
    private var imageName: String //read image name from data
    // image property that loads image from asset
    var image: Image{
        Image(imageName)
    }
    
    // returns the feature image if it exists
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
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
