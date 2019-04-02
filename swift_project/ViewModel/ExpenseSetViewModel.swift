//
//  ExpenseSetViewModel.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ExpenseSetViewModel{
    
    var expenseSet:[Expense] = []
    
    init(){
    }
    
    init(expenseSet: ExpenseSet){
        for expense in expenseSet.expenseList{
            self.expenseSet.append(expense)
        }
    }
    
    func getExpenseByIndex(index: Int?) -> Expense?{
        if let i = index {
            if i>=0 && i<self.expenseSet.count {
                return self.expenseSet[i]
            }
        }
        return nil
    }
    
    func getIndexByExpense(expense: Expense) -> Int?{
        var indexPath = -1
        for index in 0...expenseSet.count{
            if expense == expenseSet[index]{
                indexPath = index
            }
        }
        if(indexPath == -1){
            return nil
        }
        return indexPath
    }
    
}
