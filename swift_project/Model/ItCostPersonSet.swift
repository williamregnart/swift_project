//
//  ItPersonSet.swift
//  swift_project
//
//  Created by Antoine REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ItCostPersonSet : IteratorProtocol {
    
    typealias Element = CostPerson
    var iteratorIndex: Int = 0
    
    var costPerson = CostPersonSet()
    
    init(costPerson: CostPersonSet) {
        self.costPerson=costPerson
    }
    
    func next() -> CostPerson? {
        if self.iteratorIndex >= costPerson.count-1 {
            return nil
        }
            
        else {
            self.iteratorIndex += 1
        }
        
        return self.costPerson.personsCost[iteratorIndex]
    }
    
    func reset(){
        self.iteratorIndex=0
    }
    
    var current:CostPerson?{
        if iteratorIndex>=costPerson.count{
            return nil
        }
        else{
            return self.costPerson.personsCost[iteratorIndex]
        }
    }
    
    var end:Bool{
        return self.iteratorIndex>=costPerson.count
    }
    
    
}
