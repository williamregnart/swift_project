//
//  CostPerson.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

extension CostPerson{
    
    
    convenience init(person:Person,amount:Double, cost: Cost){
        self.init()
        self.concernPerson=person
        self.concernCost=cost
        self.amount = amount
    }
    
    convenience init(costPerson: CostPerson){
        self.init()
        self.concernPerson = costPerson.concernPerson!
        self.concernCost = costPerson.concernCost!
        self.amount = costPerson.amount
    }
    
    static func == (p1: CostPerson, p2: CostPerson) -> Bool{
        return (p1.concernPerson == p2.concernPerson) && (p1.concernCost == p2.concernCost)
    }
    
    static func !=(p1: CostPerson, p2: CostPerson) -> Bool{
        return !(p1 == p2)
    }
}
