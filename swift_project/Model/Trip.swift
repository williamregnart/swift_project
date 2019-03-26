//
//  Trip.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Trip{
    
    var tname:String {return self.name ?? ""}
    var timage: UIImageView? {return self.image as UIImageView}
    var tgroup:PersonSet {return PersonSet(persons: [])}
    var tdate_creation:Date {return self.date_creation}
    var tdate_begin:Date? {return self.date_begin}
    var tdate_end:Date? {return self.date_end}
    var tcostSet:CostSet {return CostSet(Costs: [])}
    
    init(name:String,descriptive:String){
        self.name=name
        self.group=PersonSet.init()
        self.date_creation=Date()
        self.costSet = CostSet(Costs: [])
        self.image = nil
    }
    
    init(name:String){
        self.name=name
        self.group=PersonSet.init()
        self.date_creation=Date()
        self.costSet = CostSet(Costs: [])
        self.image = nil
    }
}
