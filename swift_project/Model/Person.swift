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
    
}
