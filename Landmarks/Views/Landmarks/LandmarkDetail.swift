//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/10/23.
//

import SwiftUI

struct LandmarkDetail: View {
    // need access to the environment's model data
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    // compute the index of the input landmark by comparing it with the model data
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top) // allow map content to extend to the top edge of the screen
            CircleImage(image: landmark.image)
                .offset(y: -130) // layer over map view
                .padding(.bottom, -130)
            VStack (alignment: .leading){
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    // binding o the isFavorite property
                    // use landmarkIndex with modelData object to ensure that the button  updtaes the isFavorite property of the landmark stored in model object
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                    
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        } // provide bounds space for vstack
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
