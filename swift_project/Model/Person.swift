//
//  Person.swift
//  swift_project
//
//  Created by WILLIAM REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData

extension Person{

    var pname: String{return self.name!}

    //Liste de type ExpenseSet des depenses de la personne
    var expenses: ExpenseSet{
        let expenseList = ExpenseDAO.getDebtByPerson(person: self)
        let result = ExpenseSet()
        for expense in expenseList{

            result.add(expense: expense)
        }
        return result
    }

    //Liste de type ExpenseSet des creances de la personne
    var creances: ExpenseSet{
        let creanceList = ExpenseDAO.getCreanceByPerson(person: self)
        let result = ExpenseSet()
        for creance in creanceList{
            result.add(expense: creance)
        }
        return result
    }

    var creancesExpensePerson: ExpensePersonSet{
        let creanceList = ExpensePersonDAO.getExpensesPersonByPerson(person: self)
        let result = ExpensePersonSet()
        for creance in creanceList{
            result.add(expensePerson: creance)
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

        //Parcours de la liste des dépenses pour la personne
        for expense in self.expenses {
            if(expense.epersonsConcerned.count != 0 && (expense.paidBy?.contains(self))!){
                let sumToAdd = (expense.paidBy?.anyObject() as! ExpensePerson).amount
                blc = blc - sumToAdd / Double(expense.epersonsConcerned.count)
            }
        }
        //Parcours de la liste des personnes ayant payé pour la dépense
        //Si la personne a payé, on ajoute le montant qu'elle a payé à sa balance
        for creance in self.creancesExpensePerson{
            if creance.concernPerson == self {
                blc += creance.amount
            }
        }

        return blc
    }

}
