//
//  Cost.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

extension Cost{
    var cname:String {return self.name ?? ""}
    var cpersonsConcerned:PersonSet {return PersonSet()}
    var cpersonsWhoPaid:CostPersonSet {return CostPersonSet()}
    
    convenience init(name:String, personsConcerned:PersonSet,personsWhoPaid:CostPersonSet){
        self.init(context: CoreDataManager.context)
        self.name=name
        //self.cpersonsConcerned=personsConcerned
        //self.cpersonsWhoPaid=personsWhoPaid
    }
    
    var amount :  Double{
        var total:Double=0
        for costPerson in self.cpersonsWhoPaid.personsCost {
            total += costPerson.cpcost
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
