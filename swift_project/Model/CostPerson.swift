//
//  CostPerson.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

extension CostPerson{
    
    var cpperson: Person {
        get{
            return concernPerson!
        } set {
            self.cpperson = newValue
        }
    }
    var cpcost:Double  {
        get {
            return (concernCost?.amount)!
        } set {
            self.cpcost = newValue
        }
    }
    
    convenience init(person:Person,cost:Double){
        self.init()
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
