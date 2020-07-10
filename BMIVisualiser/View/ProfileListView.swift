//
//  ContentView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 10/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct ProfileListView: View {
    var body: some View {
        VStack {
            ProfileHeaderView(title: "BMIVisualiser")
            
            List (0 ..< 5) { item in
                ProfileRowView()
            }
        }
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView()
    }
}


