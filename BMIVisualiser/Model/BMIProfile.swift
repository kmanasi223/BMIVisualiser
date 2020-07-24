//
//  BMIProfile.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 13/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import Foundation
import CoreData

@objc(BMIProfile)
class BMIProfile: NSManagedObject {
    @NSManaged var name : String?
    @NSManaged var dob : Date?
    
    @NSManaged var details : Set<BMDetails>?
}
