//
//  ItPersonSet.swift
//  swift_project
//
//  Created by Antoine REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ItCostSet : IteratorProtocol {
    
    typealias Element = Cost
    var iteratorIndex: Int = 0
    
    var costs = CostSet()
    
    init(costs: CostSet) {
        self.costs=costs
    }
    
    func next() -> Cost? {
        if self.iteratorIndex >= costs.count-1 {
            return nil
        }
            
        else {
            self.iteratorIndex += 1
        }
        
        return self.costs.costList[iteratorIndex]
    }
    
    func reset(){
        self.iteratorIndex=0
    }
    
    var current:Cost?{
        if iteratorIndex>=costs.count{
            return nil
        }
        else{
            return self.costs.costList[iteratorIndex]
        }
    }
    
    var end:Bool{
        return self.iteratorIndex>=costs.count
    }
    
    
}
