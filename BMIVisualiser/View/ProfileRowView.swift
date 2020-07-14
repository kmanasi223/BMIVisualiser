//
//  ProfileRowView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 10/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct ProfileRowView: View {
    var profile : BMIProfile
    
    var body: some View {
        HStack {
            Text(profile.name ?? "")
            Spacer()
            Button(action: {
                print("add new info for new date")
            }) {
                Image(systemName: "calendar.badge.plus")
            }
            Button(action: {
                print("Edit Profile info")
            }) {
                Image(systemName: "pencil")
            }
            Button(action: {
                print("view graph")
            }) {
                Image(systemName: "chart.bar")
            }
            Button(action: {
                print("delete")
            }) {
                Image(systemName: "trash.circle")
            }
        }
    .padding()
    }
}

struct ProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRowView(profile: BMIProfile(id: 0, name: "TestName", dob: Date()))
    }
}
