//
//  CostPerson.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

extension ExpensePerson{
    
    
    convenience init(person:Person,amount:Double, expense: Expense){
        self.init()
        self.concernPerson=person
        self.concernExpense=expense
        self.amount = amount
    }
    
    convenience init(expensePerson: ExpensePerson){
        self.init()
        self.concernPerson = expensePerson.concernPerson!
        self.concernExpense = expensePerson.concernExpense!
        self.amount = expensePerson.amount
    }
    
    static func == (p1: ExpensePerson, p2: ExpensePerson) -> Bool{
        return (p1.concernPerson == p2.concernPerson) && (p1.concernExpense == p2.concernExpense)
    }
    
    static func !=(p1: ExpensePerson, p2: ExpensePerson) -> Bool{
        return !(p1 == p2)
    }
}
