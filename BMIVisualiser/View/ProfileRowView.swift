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
    @State var displayCreateProfileView : Bool = false
    
    var body: some View {
        HStack {
            Text(profile.name ?? "")
            Spacer()
            Button(action: {
                print("add new info for new date")
                return
            }) {
                Image(systemName: "calendar.badge.plus")
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.black)
            
            Button(action: {
                self.displayCreateProfileView = true
                return
            }) {
                Image(systemName: "pencil")
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.black)
            .sheet(isPresented: $displayCreateProfileView) {
                CreateProfileView(isModifyViewMode: true,
                                  profile: self.profile,
                                  isPresented: self.$displayCreateProfileView,
                                  profileName: self.profile.name ?? "",
                                  birthDate: self.profile.dob ?? Date())
            }
            
            Button(action: {
                print("view graph")
                return
            }) {
                Image(systemName: "chart.bar")
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.black)
            
            Button(action: {
                self.deleteProfile()
                return
            }) {
                Image(systemName: "trash.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.black)
        }
    .padding()
    }
    
    func deleteProfile() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appdelegate.persistentContainer.viewContext
        managedObjectContext.delete(self.profile)
        appdelegate.saveContext()
    }
}

struct ProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        let profiles = CoreDataManager.fetchEntity("BMIProfile") as! [BMIProfile]
        return ProfileRowView(profile: profiles.first!)
    }
}
