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
    // private state variable that holds the region information for the app
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
