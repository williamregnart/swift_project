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
    
    var debts: [Cost] = []
    
    var creances: [Cost] = []
    
    var creancesCostPerson: [CostPerson] = []
    
    init(person: Person){
        self.person = person
        self.name = person.name ?? ""
        for debt in person.costs{
            self.debts.append(debt)
        }
        for creance in person.creances{
            self.creances.append(creance)
        }
        for creanceCostPerson in person.creancesCostPerson{
            self.creancesCostPerson.append(creanceCostPerson)
        }
    }
    
    func getDebtByIndex(index: Int?) -> Cost?{
        if let i = index {
            if i>=0 && i<self.debts.count {
                return self.debts[i]
            }
        }
        return nil
    }
    
    func getCreanceByIndex(index: Int?) -> Cost?{
        if let i = index {
            if i>=0 && i<self.creances.count {
                return self.creances[i]
            }
        }
        return nil
    }
}
