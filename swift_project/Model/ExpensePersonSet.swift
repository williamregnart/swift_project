//
//  ExpensePersonSet.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ExpensePersonSet: Sequence{
    
    var expensesPerson:[ExpensePerson]
    
    init(){
        self.expensesPerson=[]
    }
    
    var isEmpty : Bool {
        return self.expensesPerson.isEmpty
    }
    
    func add(expensePerson : ExpensePerson){
        if self.contains(expensePerson : expensePerson){
            return
        } else {
            expensesPerson.append(expensePerson)
        }
    }
    
    func remove(expensePerson : ExpensePerson){
        guard let index = self.indexOf(expensePerson : expensePerson) else {
            return
        }
        expensesPerson.remove(at: index)
    }
    
    var count : Int {
        return self.expensesPerson.count
    }
    
    func indexOf(expensePerson : ExpensePerson) -> Int? {
        var i : Int? = nil
        for index in 0..<expensesPerson.count {
            if expensesPerson[index]==expensePerson {
                i = index
            }
        }
        return i
    }
    
    func contains(person : Person)-> Bool {
        var cont : Bool = false
        for p in expensesPerson {
            if p.concernPerson==person {
                cont = true
            }
        }
        return cont
    }
    
    func contains(expensePerson : ExpensePerson) -> Bool {
        var cont : Bool = false
        for p in expensesPerson {
            if p == expensePerson {
                cont = true
            }
        }
        return cont
    }
    
    func look(expensePerson: ExpensePerson) -> ExpensePerson? {
        guard let index = indexOf(expensePerson: expensePerson) else{
            return nil
        }
        return expensesPerson[index]
    }
    
    func makeIterator() -> ItExpensePersonSet{
        let iterator: ItExpensePersonSet = ItExpensePersonSet(expensePersons: self)
        return iterator
    }
}
