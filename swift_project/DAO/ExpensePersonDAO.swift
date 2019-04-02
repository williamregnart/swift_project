//
//  ExpensePersonDAO.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData

class ExpensePersonDAO{
    
    static let request :NSFetchRequest<ExpensePerson> = ExpensePerson.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(expensePerson: ExpensePerson){
        CoreDataManager.context.delete(expensePerson)
    }
    
    static func insert(expensePerson: ExpensePerson){
        CoreDataManager.context.insert(expensePerson)
    }
    
    static func getAllExpensePerson() -> [ExpensePerson]{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return []
        }
    }
    
    static func getExpensesPersonByPerson(person: Person) -> [ExpensePerson]{
        let expensesPerson = person.payExpense
        return expensesPerson as! [ExpensePerson]? ?? []
    }
}
