//
//  ProfileHeaderView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 10/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct ProfileHeaderView: View {
    var title : String
    @State var displayIcon : Bool = true
    @State var displayCreateProfileView : Bool = false
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            if displayIcon {
                Button(action : {
                    self.displayCreateProfileView = true
                    print("add new profile")
                }) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileHeaderView(title: "BMIVisualiser", displayIcon: false)
            ProfileHeaderView(title: "BMIVisualiser")
        }
    }
}
