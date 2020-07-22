//
//  ProfileDetailsView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 22/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct ProfileDetailsView: View {
    @Binding var isPresented: Bool
    
    @State var weight : String = ""
    @State var height : String = ""
    @State var dateOfBM = Date()
    
    var body: some View {
        VStack {
            ProfileHeaderView(title: "Profile Details View",displayIcon: false)
            Form {
                HStack {
                    Text("Weight (in kg) :")
                    TextField("Enter weight", text: $weight)
                }
                HStack {
                    Text("Height (in cm) :")
                    TextField("Enter height", text: $height)
                }
                
                DatePicker("Date of evaluation :", selection: $dateOfBM, in: ...Date(), displayedComponents: .date)
                
                Spacer()
                HStack(alignment: .center) {
                    Button(action : {
                        self.isPresented = false
                    }) {
                        Text("Save")
                    }
                    Spacer()
                    Button(action : {
                        print("cancel")
                        self.isPresented = false
                    }) {
                        Text("Cancel")
                    }
                }
                .padding()
            }
        }
    }
}

struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView(isPresented: .constant(true))
    }
}
