//
//  ItPersonSet.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ItPersonSet : IteratorProtocol {
    
    typealias Element = Person
    var iteratorIndex: Int = 0
    
    var persons = PersonSet()
    
    init(persons:PersonSet) {
        self.persons=persons
    }
    
    func next() -> Person? {
        if self.iteratorIndex >= persons.count-1 {
            return nil
        }
            
        else {
            self.iteratorIndex += 1
        }
        
        return self.persons.personList[iteratorIndex]
    }
    
    func reset(){
        self.iteratorIndex=0
    }
    
    var current:Person?{
        if iteratorIndex>=persons.count{
            return nil
        }
        else{
            return self.persons.personList[iteratorIndex]
        }
    }
    
    var end:Bool{
        return self.iteratorIndex>=persons.count
    }
    
    
}
