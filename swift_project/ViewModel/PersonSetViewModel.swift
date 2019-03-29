//
//  PersonSetViewModel.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class PersonSetViewModel{
    
    var personSet:[Person] = []
    
    init(personSet: PersonSet){
        for person in personSet.personList{
            self.personSet.append(person)
        }
    }
    
    func getPersonByIndex(index: Int?) -> Person?{
        if let i = index {
            if i>=0 && i<self.personSet.count {
                return self.personSet[i]
            }
        }
        return nil
    }
    
    func addPerson(personName name : String?){
        if name == nil {
            return
        }
        let person : Person = Person(name : name!)
        PersonDAO.insert(person: person)
        self.personSet = PersonDAO.getAllPerson()
    }
    
    func getIndexByPerson(person: Person) -> Int?{
        var indexPath = -1
        for index in 0...personSet.count{
            if person == personSet[index]{
                indexPath = index
            }
        }
        if(indexPath == -1){
            return nil
        }
        return indexPath
    }
    
}
