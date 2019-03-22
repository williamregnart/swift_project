//
//  Cost.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class Cost{
    let name:String
    var personsConcerned:PersonSet
    var personsWhoPaid:CostPersonSet
    
    init(name:String, personsConcerned:PersonSet,personsWhoPaid:CostPersonSet){
        self.name=name
        self.personsConcerned=personsConcerned
        self.personsWhoPaid=personsWhoPaid
    }
    
    var amount:Double{
        var total:Double=0
        for costPerson in self.personsWhoPaid.personsCost {
            total += costPerson.cost
        }
        return total
    }
    
    static func == (c1: Cost, c2: Cost) -> Bool{
        return c1.name == c2.name
    }
    
    static func !=(c1: Cost, c2: Cost) -> Bool{
        return !(c1 == c2)
    }
    
    
}
