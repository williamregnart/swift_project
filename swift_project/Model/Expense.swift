//
//  Cost.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

extension Expense{
    var ename:String {return self.name ?? ""}
    var epersonsConcerned:PersonSet {return PersonSet()}
    var epersonsWhoPaid:ExpensePersonSet {return ExpensePersonSet()}
    
    convenience init(name:String){
        self.init(context: CoreDataManager.context)
        self.name=name
        //self.cpersonsConcerned=personsConcerned
        //self.cpersonsWhoPaid=personsWhoPaid
    }
    
    var amount :  Double{
        var total:Double=0
        for expensePerson in self.epersonsWhoPaid.expensesPerson {
            total += expensePerson.amount
        }
        return total
    }
    
    static func == (e1: Expense, e2: Expense) -> Bool{
        return e1.name == e2.name
    }
    
    static func !=(e1: Expense, e2: Expense) -> Bool{
        return !(e1 == e2)
    }
    
    
}
