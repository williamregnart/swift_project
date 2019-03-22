//
//  CostPerson.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class CostPerson{
    
    let person:Person
    let cost:Double
    
    init(person:Person,cost:Double){
        self.person=person
        self.cost=cost
    }
    
    static func == (p1: CostPerson, p2: CostPerson) -> Bool{
        return (p1.person == p2.person)

    }
    
    static func !=(p1: CostPerson, p2: CostPerson) -> Bool{
        return !(p1 == p2)
    }
}
