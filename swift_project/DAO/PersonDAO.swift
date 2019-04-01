//
//  PersonDAO.swift
//  swift_project
//
//  Created by Antoine SANCHEZ on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData

class PersonDAO{
    static let request :NSFetchRequest<Person> = Person.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(person p : Person){
        CoreDataManager.context.delete(p)
    }
    
    static func insert(person p : Person){
        let personData = Person(context: CoreDataManager.context)
        personData.name = p.name
        CoreDataManager.context.insert(p)
        self.save()
    }
    
    static func update(person p : Person){
        
    }
    
    static func getAllPerson()->[Person]{
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return []
        }
    }
    
    static func getPerson(person p : Person)->Person{
        var result : Person = Person(name: "")
        let persons : [Person] = getAllPerson()
        for person : Person in persons {
            if person == p {
                result = p
            }
        }
        return result
    }
}
