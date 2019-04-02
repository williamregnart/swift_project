//
//  ItExpensePersonSet.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ItExpensePersonSet : IteratorProtocol {
    
    typealias Element = ExpensePerson
    var iteratorIndex: Int = 0
    
    var expensePersons = ExpensePersonSet()
    
    init(expensePersons:ExpensePersonSet) {
        self.expensePersons=expensePersons
    }
    
    func next() -> ExpensePerson? {
        if self.iteratorIndex >= expensePersons.count-1 {
            return nil
        }
            
        else {
            self.iteratorIndex += 1
        }
        
        return self.expensePersons.expensesPerson[iteratorIndex]
    }
    
    func reset(){
        self.iteratorIndex=0
    }
    
    var current:ExpensePerson?{
        if iteratorIndex>=expensePersons.count{
            return nil
        }
        else{
            return self.expensePersons.expensesPerson[iteratorIndex]
        }
    }
    
    var end:Bool{
        return self.iteratorIndex>=expensePersons.count
    }
    
    
}

