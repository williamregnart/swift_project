//
//  ExpensePersonPersonSetViewModel.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ExpensePersonSetViewModel{
    
    var expensePersonSet:[ExpensePerson] = []
    
    init(){
    }
    
    init(expensePersonSet: ExpensePersonSet){
        for expensePerson in expensePersonSet.expensesPerson{
            self.expensePersonSet.append(expensePerson)
        }
    }
    
    func getExpensePersonByIndex(index: Int?) -> ExpensePerson?{
        if let i = index {
            if i>=0 && i<self.expensePersonSet.count {
                return self.expensePersonSet[i]
            }
        }
        return nil
    }
    
    func getIndexByExpensePerson(expensePerson: ExpensePerson) -> Int?{
        var indexPath = -1
        for index in 0...expensePersonSet.count{
            if expensePerson == expensePersonSet[index]{
                indexPath = index
            }
        }
        if(indexPath == -1){
            return nil
        }
        return indexPath
    }
    
}
