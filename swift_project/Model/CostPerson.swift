//
//  CostPerson.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

extension CostPerson{
    
    var cpperson: Person {return concernPerson!}
    var cpcost:Double  {return (concernCost?.amount)!}
    
    convenience init(person:Person,cost:Double){
        self.cpperson=person
        self.cpcost=cost
    }
    
    static func == (p1: CostPerson, p2: CostPerson) -> Bool{
        return (p1.cpperson == p2.cpperson) && (p1.cpcost == p2.cpcost)
    }
    
    static func !=(p1: CostPerson, p2: CostPerson) -> Bool{
        return !(p1 == p2)
    }
}
