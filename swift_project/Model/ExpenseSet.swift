//
//  ExpenseSet.swift
//  swift_project
//
//  Created by WILLIAM REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ExpenseSet : Sequence{

    var expenseList : [Expense]

    init(){
        self.expenseList = ExpenseDAO.getAllExpense()
    }

    var isEmpty : Bool {
        return self.expenseList.isEmpty
    }

    func add(expense : Expense){
        if self.contains(expense : expense){
            return
        } else {
            expenseList.append(expense)
            ExpenseDAO.insert(expense: expense)
        }
    }

    func remove(expense : Expense){
        guard let index = self.indexOf(expense: expense) else {
            return
        }
        expenseList.remove(at: index)
    }

    var count : Int {
        return self.expenseList.count
    }

    func indexOf(expense : Expense) -> Int? {
        var i : Int? = nil
        for index in 0..<expenseList.count {
            if expenseList[index] == expense {
                i = index
            }
        }
        return i
    }

    func contains(expense : Expense)-> Bool {
        var cont : Bool = false
        for c in expenseList {
            if c.name==expense.name {
                cont = true
            }
        }
        return cont
    }

    func look(expense: Expense) -> Expense? {
        guard let index = indexOf(expense: expense) else{
            return nil
        }
        return expenseList[index]
    }

    func makeIterator() -> ItExpenseSet{
        let iterator: ItExpenseSet = ItExpenseSet(expenses: self)
        return iterator
    }

    func addExpense(expense : Expense){
        expenseList.append(expense)
    }
}
