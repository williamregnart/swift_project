//
//  CostDAO.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData

class CostDAO{
    
    static let requestCost  :NSFetchRequest<Cost> = Cost.fetchRequest()
    static let requestPerson :NSFetchRequest<Person> = Person.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(cost: Cost){
        CoreDataManager.context.delete(cost)
    }
    
    static func insert(cost: Cost){
        CoreDataManager.context.insert(cost)
    }
    
    static func getAllCost() -> [Cost]{
        self.requestCost.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.requestCost)
        }
        catch{
            return []
        }
    }
    
    static func getCostbyPerson(person: Person) -> [Cost]{
        let costs = person.hasToPayCost
        return costs as! [Cost]? ?? []
    }
    
    static func getCreanceByPerson(person: Person) -> [Cost]{
        let costsPerson = person.payCost
        var result: [Cost] = []
        for costPerson: Any in costsPerson! {
            let c: CostPerson = costPerson as! CostPerson
            result.append(c.concernCost!)
        }
        return result
    }
}
