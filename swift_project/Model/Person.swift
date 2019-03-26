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
    func balance(trip : Trip) -> Double {
        var balance : Double = 0.0
        
        //Parcours de la liste des dépenses pour le voyage
        for cost in trip.tcostSet {
            
            //Parcours de la liste des personnes concernées par la dépense
            //Si la personne est concernée, on a payé pour elle donc on retire le montant de la dépense divisé par le nombre de personnes concernées de sa balance
            for person in cost.cpersonsConcerned{
                if self == person {
                    balance -= cost.amount / Double(cost.cpersonsConcerned.count)
                }
            }
            //Parcours de la liste des personnes ayant payé pour la dépense
            //Si la personne a payé, on ajoute le montant qu'elle a payé à sa balance
            for costPerson in cost.cpersonsWhoPaid{
                if self == costPerson.cpperson {
                    balance += costPerson.cpcost
                }
            }
        }
        
        return balance
    }
    
}
