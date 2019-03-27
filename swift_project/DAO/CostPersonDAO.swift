//
//  CostPersonDAO.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData

class CostPersonDAO{
    
    static let request :NSFetchRequest<CostPerson> = CostPerson.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(costPerson: CostPerson){
        CoreDataManager.context.delete(costPerson)
    }
    
    static func insert(costPerson: CostPerson){
        CoreDataManager.context.insert(costPerson)
    }
    
    static func getAllCostPerson() -> [CostPerson]{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return []
        }
    }
    
    static func getCostsPersonByPerson(person: Person) -> [CostPerson]{
        let costsPerson = person.payCost
        return costsPerson as! [CostPerson]? ?? []
    }
}
