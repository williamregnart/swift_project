//
//  ExpenseDAO.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData

class ExpenseDAO{

    static let request :NSFetchRequest<Expense> = Expense.fetchRequest()

    static func save(){
        CoreDataManager.save()
    }

    //self explanatory : deletes expense
    static func delete(expense: Expense){
        CoreDataManager.context.delete(expense)
    }

    //insert an expense
    static func insert(expense: Expense){
        CoreDataManager.save()
    }

    //gets every single expense
    static func getAllExpense() -> [Expense]{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return []
        }
    }

    //gets expenses on which the person parameter owes money
    static func getDebtByPerson(person: Person) -> [Expense]{
        let expenses = person.hasToPayExpense
        var result : [Expense] = []
        if expenses == nil {
            return result
        }
        for expense in expenses!{
            result.append(expense as! Expense)
        }
        return result
    }

    //gets expenses which the person parameter paid
    static func getCreanceByPerson(person: Person) -> [Expense]{
        let expensesPerson = person.payExpense
        var result: [Expense] = []
        for expensePerson: Any in expensesPerson! {
            let c: ExpensePerson = expensePerson as! ExpensePerson
            result.append(c.concernExpense!)
        }
        return result
    }
}
