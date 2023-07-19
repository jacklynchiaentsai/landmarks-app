//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/18/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        // this view showcases one or more featured landmarks at the top
        NavigationView {
            List{
                PageView(pages: modelData.features.map{FeatureCard(landmark: $0)})
                    .aspectRatio(3/2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                    // content can extend to the edges of the display
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self){
                    key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }.listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
                .navigationTitle("NYC Spots 🗽")
                /*
                .toolbar{
                    Button{
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                 */
                .sheet(isPresented: $showingProfile){
                    ProfileHost()
                        .environmentObject(modelData)
                }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
