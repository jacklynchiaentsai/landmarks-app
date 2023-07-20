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
 - state is a value or a set of values that affect's a view's behavior
 - use a property with @State attribute to add state to a view
 - binding acts as a reference to a mutable state
 - to combine static and dynamic views in a list or to combine two or more different groups of dynamic groups use foreach instead of passing to list
 - use $ prefix to access a binding to a state variable or one of its properties
 - both the detail and list view access the same model object in the environment so the two views maintain consistency
 */

import SwiftUI

struct LandmarkList: View {
    // modekData property gets its value automatically as long as the envrionment Object modifier has been applied to a parent
    @EnvironmentObject var modelData: ModelData
    // always create state as private
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{ landmark in (!showFavoritesOnly || landmark.isFavorite)
            
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks){
                    landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            // setting the title of the navigation bar when displaying the list
            .navigationTitle("NYC List 🗽")
            
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
                .environmentObject(ModelData())
        }
    }
}
