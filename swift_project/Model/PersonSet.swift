//
//  PersonSet.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class PersonSet: Sequence {
    
    var personList : [Person]
    
    init(){
        self.personList = []
    }
    
    init(persons : [Person]){
        self.personList = persons
    }
    
    var isEmpty : Bool {
        return self.personList.isEmpty
    }
    
    func add(person : Person){
        if self.contains(person : person){
            return
        } else {
            personList.append(person)
        }
    }
    
    func remove(person : Person){
        guard let index = self.indexOf(person: person) else {
            return
        }
        personList.remove(at: index)
    }
    
    var count : Int {
        return self.personList.count
    }
    
    func indexOf(person : Person) -> Int? {
        var i : Int? = nil
        for index in 0..<personList.count {
            if personList[index]==person {
                i = index
            }
        }
        return i
    }
    
    func contains(person : Person)-> Bool {
        var cont : Bool = false
        for p in personList {
            if p.pname==person.pname {
                cont = true
            }
        }
        return cont
    }
    
    func look(person: Person) -> Person? {
        guard let index = indexOf(person: person) else{
            return nil
        }
        return personList[index]
    }
    
    func look(pname: String) -> [Person]{
        var persons : [Person] = []
        for p in self.personList {
            if p.pname == pname {
                persons.append(p)
            }
        }
        return persons
    }
    
    func makeIterator() -> ItPersonSet{
        let iterator: ItPersonSet = ItPersonSet(persons: self)
        return iterator
    }
    
    
    
}

