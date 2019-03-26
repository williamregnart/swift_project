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
    var persons: PersonSet {return PersonSet(persons: [])}
    var tdate_creation:Date {return self.date_creation!}
    var tdate_begin:Date? {return self.date_begin}
    var tdate_end:Date? {return self.date_end}
    var tcostSet:CostSet {return CostSet()}
    
    convenience init(name:String,image: UIImage?,date_begin: Date?,date_end: Date?){
        self.init(context: CoreDataManager.context)
        self.name=name
        guard image != nil else{
            return
        }
        self.image = image?.pngData()
        self.getPersons()
        self.date_creation=Date()
    }
    
    func getPersons(){
        for p: Any in self.mutableArrayValue(forKey: "hasPerson"){
            if((p as! Person).belongsTo == self){
                persons.add(person: p as! Person)
            }
        }
    }
}
