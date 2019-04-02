//
//  ItExpenseSet.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ItExpenseSet : IteratorProtocol {
    
    typealias Element = Expense
    var iteratorIndex: Int = 0
    
    var expenses = ExpenseSet()
    
    init(expenses:ExpenseSet) {
        self.expenses=expenses
    }
    
    func next() -> Expense? {
        if self.iteratorIndex >= expenses.count-1 {
            return nil
        }
            
        else {
            self.iteratorIndex += 1
        }
        
        return self.expenses.expenseList[iteratorIndex]
    }
    
    func reset(){
        self.iteratorIndex=0
    }
    
    var current:Expense?{
        if iteratorIndex>=expenses.count{
            return nil
        }
        else{
            return self.expenses.expenseList[iteratorIndex]
        }
    }
    
    var end:Bool{
        return self.iteratorIndex>=expenses.count
    }
    
    
}

