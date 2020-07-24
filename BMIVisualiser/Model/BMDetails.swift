//
//  BMDetails.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 22/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import Foundation
import CoreData

@objc(BMDetails)
class BMDetails: NSManagedObject {
    @NSManaged var height : String?
    @NSManaged var weight : String?
    @NSManaged var dateOfEvaluation : Date?
    @NSManaged var bmi : String?
}
