//
//  CostPersonSet.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class CostPersonSet{
    
    var personsCost:[CostPerson]
    
    init(){
        self.personsCost=[]
    }
    
    var isEmpty : Bool {
        return self.personsCost.isEmpty
    }
    
    func add(personCost : CostPerson){
        if self.contains(personCost : personCost){
            return
        } else {
            personsCost.append(personCost)
        }
    }
    
    func remove(personCost : CostPerson){
        guard let index = self.indexOf(personCost : personCost) else {
            return
        }
        personsCost.remove(at: index)
    }
    
    var count : Int {
        return self.personsCost.count
    }
    
    func indexOf(personCost : CostPerson) -> Int? {
        var i : Int? = nil
        for index in 0..<personsCost.count {
            if personsCost[index]==personCost {
                i = index
            }
        }
        return i
    }
    
    func contains(person : Person)-> Bool {
        var cont : Bool = false
        for p in personsCost {
            if p.person==person {
                cont = true
            }
        }
        return cont
    }
    
    func contains(personCost : CostPerson) -> Bool {
        var cont : Bool = false
        for p in personsCost {
            if p == personCost {
                cont = true
            }
        }
        return cont
    }
    
    func look(personCost: CostPerson) -> CostPerson? {
        guard let index = indexOf(personCost: personCost) else{
            return nil
        }
        return personsCost[index]
    }
    
}
