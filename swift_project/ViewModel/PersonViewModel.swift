//
//  PersonViewModel.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class PersonViewModel{
    
    var person : Person
    
    var name: String
    
    var debts: [Expense] = []
    
    var creances: [Expense] = []
    
    var creancesExpensePerson: [ExpensePerson] = []
    
    init(person: Person){
        self.person = person
        self.name = person.name ?? ""
        for debt in person.expenses{
            self.debts.append(debt)
        }
        for creance in person.creances{
            self.creances.append(creance)
        }
        for creanceExpensePerson in person.creancesExpensePerson{
            self.creancesExpensePerson.append(creanceExpensePerson)
        }
    }
    
    func getDebtByIndex(index: Int?) -> Expense?{
        if let i = index {
            if i>=0 && i<self.debts.count {
                return self.debts[i]
            }
        }
        return nil
    }
    
    func addExpense(expense : Expense) {
        PersonDAO.addExpense(expense : expense)
    }
    
    func getCreanceByIndex(index: Int?) -> Expense?{
        if let i = index {
            if i>=0 && i<self.creances.count {
                return self.creances[i]
            }
        }
        return nil
    }
}
