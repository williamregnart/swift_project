//
//  Person.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData

extension Person{
    
    var pname: String{return self.name!}
    
    //Liste de type CostSet des depenses de la personne
    var costs: CostSet{
        let costList = CostDAO.getDebtByPerson(person: self)
        let result = CostSet()
        for cost in costList{
            result.add(cost: cost)
        }
        return result
    }
    
    //Liste de type CostSet des creances de la personne
    var creances: CostSet{
        let creanceList = CostDAO.getCreanceByPerson(person: self)
        let result = CostSet()
        for creance in creanceList{
            result.add(cost: creance)
        }
        return result
    }
    
    var creancesCostPerson: CostPersonSet{
        let creanceList = CostPersonDAO.getCostsPersonByPerson(person: self)
        let result = CostPersonSet()
        for creance in creanceList{
            result.add(personCost: creance)
        }
        return result
    }
    
    convenience init(name: String){
        self.init(context: CoreDataManager.context)
        self.name = name
    }
    
    static func == (p1: Person, p2: Person) -> Bool{
        return p1.name == p2.name
    }
    
    static func !=(p1: Person, p2: Person) -> Bool{
        return !(p1 == p2)
    }
    
    //Calcul de la balance de la personne
    //Trip: Voyage pour lequel on calcule la balance de la personne
    //Retourne un double positif si on doit de l'argent à cette personne, négatif si cette personne doit de l'argent
    var balance:Double{
        var blc: Double = 0.0
        
        //Parcours de la liste des dépenses pour le voyage
        for cost in self.costs {
            blc -= cost.amount / Double(cost.cpersonsConcerned.count)
        }
        //Parcours de la liste des personnes ayant payé pour la dépense
        //Si la personne a payé, on ajoute le montant qu'elle a payé à sa balance
        for creance in self.creancesCostPerson{
            blc += creance.amount
        }
        
        return blc
    }
    
}
