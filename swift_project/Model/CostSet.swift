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
        self.costList = CostDAO.getAllCost()
    }
    
    var isEmpty : Bool {
        return self.costList.isEmpty
    }
    
    func add(cost : Cost){
        if self.contains(cost : cost){
            return
        } else {
            costList.append(cost)
            CostDAO.insert(cost: cost)
        }
    }
    
    func remove(cost : Cost){
        guard let index = self.indexOf(cost: cost) else {
            return
        }
        costList.remove(at: index)
    }
    
    var count : Int {
        return self.costList.count
    }
    
    func indexOf(cost : Cost) -> Int? {
        var i : Int? = nil
        for index in 0..<costList.count {
            if costList[index] == cost {
                i = index
            }
        }
        return i
    }
    
    func contains(cost : Cost)-> Bool {
        var cont : Bool = false
        for c in costList {
            if c.name==cost.name {
                cont = true
            }
        }
        return cont
    }
    
    func look(cost: Cost) -> Cost? {
        guard let index = indexOf(cost: cost) else{
            return nil
        }
        return costList[index]
    }
    
    func makeIterator() -> ItCostSet{
        let iterator: ItCostSet = ItCostSet(costs: self)
        return iterator
    }
}
