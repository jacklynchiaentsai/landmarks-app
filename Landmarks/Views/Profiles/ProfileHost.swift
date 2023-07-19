//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/18/23.
//

import SwiftUI

struct ProfileHost: View {
    // storage in the environment
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                if (editMode?.wrappedValue == .active){
                    Button("Cancel", role: .cancel){
                        // return back to initial unmodified profile
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                // controls the edit mode environment value
                // the editing view operates on a copy of itself to avoid updating the global app state before confirming
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            } else{
                ProfileEditor(profile: $draftProfile)
                // populate the editor with the correct profile data
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
                
            }
            
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
        // ProfileSummary, a child of this view uses a property with Environment object attribute
            .environmentObject(ModelData())
    }
}
