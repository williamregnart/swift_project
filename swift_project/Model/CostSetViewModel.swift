//
//  CostSetViewModel.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class CostSetViewModel{
    
    var costSet:[Cost] = []
    
    init(costSet: CostSet){
        for cost in costSet.costList{
            self.costSet.append(cost)
        }
    }
    
    func getCostByIndex(index: Int?) -> Cost?{
        if let i = index {
            if i>=0 && i<self.costSet.count {
                return self.costSet[i]
            }
        }
        return nil
    }
    
    func getIndexByCost(cost: Cost) -> Int?{
        var indexPath = -1
        for index in 0...costSet.count{
            if cost == costSet[index]{
                indexPath = index
            }
        }
        if(indexPath == -1){
            return nil
        }
        return indexPath
    }
    
}
