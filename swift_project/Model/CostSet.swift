//
//  CostSet.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class CostSet: Sequence {
    
    var costList : [Cost]
    
    init(){
        self.costList = []
    }
    
    init(Costs : [Cost]){
        self.costList = Costs
    }
    
    var isEmpty : Bool {
        return self.costList.isEmpty
    }
    
    func add(Cost : Cost){
        if self.contains(Cost : Cost){
            return
        } else {
            costList.append(Cost)
        }
    }
    
    func remove(Cost : Cost){
        guard let index = self.indexOf(Cost: Cost) else {
            return
        }
        costList.remove(at: index)
    }
    
    var count : Int {
        return self.costList.count
    }
    
    func indexOf(Cost : Cost) -> Int? {
        var i : Int? = nil
        for index in 0..<costList.count {
            if costList[index]==Cost {
                i = index
            }
        }
        return i
    }
    
    func contains(Cost : Cost)-> Bool {
        var cont : Bool = false
        for c in costList {
            if c.name==Cost.name {
                cont = true
            }
        }
        return cont
    }
    
    func look(Cost: Cost) -> Cost? {
        guard let index = indexOf(Cost: Cost) else{
            return nil
        }
        return costList[index]
    }
    
    func makeIterator() -> ItCostSet{
        let iterator: ItCostSet = ItCostSet(costs: self)
        return iterator
    }


    
    
    
}
