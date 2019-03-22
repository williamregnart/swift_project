//
//  Trip.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class Trip{
    
    let name:String
    //RAJOUTER IMAGE
    let descriptive:String
    let group:PersonSet
    let date_creation:Date
    let date_begin:Date? = nil
    let date_end:Date? = nil
    
    init(name:String,descriptive:String){
        self.name=name
        self.descriptive=descriptive
        self.group=PersonSet.init()
        self.date_creation=Date()
    }
    
    init(name:String){
        self.name=name
        self.descriptive=""
        self.group=PersonSet.init()
        self.date_creation=Date()
    }
}
