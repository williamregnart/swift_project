//
//  Person.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class Person : Equatable {
    
    let lastName: String
    let firstName: String
    
    init(firstName fname: String, lastName lname: String){
        self.firstName = fname
        self.lastName = lname
    }
    
    var fullname : String{
        return self.firstName + " " + self.lastName
    }
    
    static func == (p1: Person, p2: Person) -> Bool{
        let lname = (p1.firstName == p2.firstName)
        let fname = (p1.lastName == p2.lastName)
        return lname && fname
    }
    
    static func !=(p1: Person, p2: Person) -> Bool{
        return !(p1 == p2)
    }
    
    //Calcul de la balance de la personne
    //Trip: Voyage pour lequel on calcule la balance de la personne
    //Retourne un double positif si on doit de l'argent à cette personne, négatif si cette personne doit de l'argent
    func balance(trip : Trip) -> Double {
        var balance : Double = 0.0
        
        //Parcours de la liste des dépenses pour le voyage
        for cost in trip.costSet {
            
            //Parcours de la liste des personnes concernées par la dépense
            //Si la personne est concernée, on a payé pour elle donc on retire le montant de la dépense divisé par le nombre de personnes concernées de sa balance
            for person in cost.personsConcerned{
                if self == person {
                    balance -= cost.amount / Double(cost.personsConcerned.count)
                }
            }
            //Parcours de la liste des personnes ayant payé pour la dépense
            //Si la personne a payé, on ajoute le montant qu'elle a payé à sa balance
            for costPerson in cost.personsWhoPaid{
                if self == costPerson.person {
                    balance += costPerson.cost
                }
            }
        }
        
        return balance
    }
    
}
