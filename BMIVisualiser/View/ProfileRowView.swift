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
    @State var displayProfileDetailsView : Bool = false
    @State var displayGraphView : Bool = false
    
    var body: some View {
        HStack {
            Text(profile.name ?? "")
            Spacer()
            Button(action: {
                self.displayProfileDetailsView = true
            }) {
                Image(systemName: "calendar.badge.plus")
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.black)
            .sheet(isPresented: $displayProfileDetailsView) {
                ProfileDetailsView(profile: self.profile, isPresented: self.$displayProfileDetailsView)
            }
            
            Button(action: {
                self.displayCreateProfileView = true
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
                self.displayGraphView = true
            }) {
                Image(systemName: "chart.bar")
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.black)
            .sheet(isPresented: $displayGraphView) {
                BMIGraph(details: self.profile.details, isPresented: self.$displayGraphView)
            }
            
            Button(action: {
                self.deleteProfile()
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
