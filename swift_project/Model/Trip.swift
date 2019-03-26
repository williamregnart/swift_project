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
    var timage: UIImage? {
        get{return UIImage(data: self.image!)}
        set{self.image = newValue?.pngData()}
    }
    var persons: Set<Person> {return PersonSet(persons: [])}
    var tdate_creation:Date {return self.date_creation!}
    var tdate_begin:Date? {return self.date_begin}
    var tdate_end:Date? {return self.date_end}
    var tcostSet:CostSet {return CostSet(Costs: [])}
    
    convenience init(name:String,image: UIImage?,date_begin: Date?,date_end: Date?){
        self.init(context: CoreDataManager.context)
        self.name=name
        guard image == nil else{
            self.image = image?.pngData()
        }
        self.group=PersonSet.init()
        self.date_creation=Date()
        self.costSet = CostSet(Costs: [])
    }
    
    init(name:String){
        self.name=name
        self.group=PersonSet.init()
        self.date_creation=Date()
        self.costSet = CostSet(Costs: [])
        self.image = nil
    }
}
