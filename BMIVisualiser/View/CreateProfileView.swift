//
//  AddProfileView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 10/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct CreateProfileView: View {
    var isModifyViewMode : Bool = false
    var profile : BMIProfile? = nil
    @Binding var isPresented: Bool
    
    @State var profileName: String = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State var birthDate = Date()
    
    var body: some View {
        VStack {
            ProfileHeaderView(title: isModifyViewMode ? "Modify a Profile" : "Create a Profile",displayIcon: false)
            Form {
                HStack {
                    Text("Name :")
                    TextField("Enter name", text: $profileName)
                }
                
                DatePicker("Date of Birth :", selection: $birthDate, in: ...Date(), displayedComponents: .date)
            }
            HStack(alignment: .center) {
                Button(action : {
                    self.isModifyViewMode ? self.modifyProfile() : self.createProfile()
                    self.isPresented = false
                }) {
                    Text(isModifyViewMode ? "Modify" : "Create")
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
    
    func createProfile() {
        let profile = CoreDataManager.insertIntoEntity("BMIProfile") as? BMIProfile
        profile?.name = self.profileName
        profile?.dob = self.birthDate
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        appdelegate?.saveContext()
    }
    
    func modifyProfile() {
        profile?.name = self.profileName
        profile?.dob = self.birthDate
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        appdelegate?.saveContext()
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(isPresented: .constant(true))
    }
}
