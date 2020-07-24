//
//  ProfileDetailsView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 22/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct ProfileDetailsView: View {
    var profile : BMIProfile?
    
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
                        self.addDetails()
                        self.isPresented = false
                    }) {
                        Text("Save")
                    }
                    Spacer()
                    Button(action : {
                        self.isPresented = false
                    }) {
                        Text("Cancel")
                    }
                }
                .padding()
            }
        }
    }
    
    func addDetails() {
        guard let profile = self.profile else { return }
        guard let detail = CoreDataManager.insertIntoEntity("BMDetails") as? BMDetails else { return }
        guard !self.height.isEmpty, !self.weight.isEmpty else { return }
        detail.height = self.height
        detail.weight = self.weight
        detail.dateOfEvaluation = self.dateOfBM
        detail.bmi = getBMI(weight: self.weight, height: self.height)
        if profile.details == nil {
            profile.details = Set([detail])
        } else {
            let details = profile.mutableSetValue(forKey: "details")
            details.addObjects(from: [detail])
        }
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        appdelegate?.saveContext()
    }
    
    func getBMI(weight: String, height: String) -> String {
        //weight - kg, height - cm
        //convert cm to m square
        let heightInCm = Double(height) ?? 0.0
        let cmsquare = heightInCm * heightInCm
        let msquare = cmsquare/10000
        let weightinKg = Double(weight) ?? 0.0
        let bmi = weightinKg / msquare
        return "\(bmi)"
    }
}

struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView(profile: nil, isPresented: .constant(true))
    }
}
