//
//  ContentView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 10/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct ProfileListView: View {
    var profileList : [BMIProfile]
    
    var body: some View {
        VStack {
            ProfileHeaderView(title: "BMIVisualiser")
            List (profileList, id: \.id) { item in
                ProfileRowView(profile: item)
            }
        }
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView(profileList: [BMIProfile(id: 0, name: "TestName", dob: Date())])
    }
}


