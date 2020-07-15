//
//  ContentView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 10/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct ProfileListView: View {
    @FetchRequest(
      entity: BMIProfile.entity(),
      sortDescriptors: [
        NSSortDescriptor(keyPath: \BMIProfile.name, ascending: true)
      ]
    ) var profileList: FetchedResults<BMIProfile>
    
    var body: some View {
        VStack {
            ProfileHeaderView(title: "BMIVisualiser")
            List (profileList, id: \.self) { item in
                ProfileRowView(profile: item)
            }
        }
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView()
    }
}

