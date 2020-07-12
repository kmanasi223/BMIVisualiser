//
//  AddProfileView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 10/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct CreateProfileView: View {
    @Binding var displayCreateProfileView: Bool
    
    @State var profileName: String = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var birthDate = Date()
    
    var body: some View {
        VStack {
            ProfileHeaderView(title: "Create a Profile",displayIcon: false)
            HStack {
                Text("Name :")
                TextField("Enter name", text: $profileName)
            }
            .padding()
            
            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                Text("DOB :")
            }
            .padding()
            
            HStack(alignment: .center) {
                Button(action : {
                    print("create a profile")
                    self.displayCreateProfileView = false
                }) {
                    Text("Create")
                }
                Spacer()
                Button(action : {
                    print("cancel")
                    self.displayCreateProfileView = false
                }) {
                    Text("Cancel")
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(displayCreateProfileView: .constant(true))
    }
}
