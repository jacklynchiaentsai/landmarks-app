//
//  MapView.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/9/23.
//
/*
 App learning tips:
 - when import swiftui and other frameworks in same file gain access to swiftUI specific functionality provided by that framework
 - @State attribute establish a source of truth for data in app that can be modified from more than one view
 - SwiftUI automatically updates views that depend on the @State value
 - prefixing a state variable with $ pass a reference to the underlying value. when the user interacts with map, map updates region value to match the UI
 - when previews are in static mode , they only fully render native SwiftUI Views
 - need to switch to live preview to render other kinds of views
 */
import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    // private state variable that holds the region information for the app
    @State private var region = MKCoordinateRegion()
    var body: some View {
        Map(coordinateRegion: $region)
        // triggers calculation of the region based on the current coordinate
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    // method that updates the region based on a coordinate value
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
