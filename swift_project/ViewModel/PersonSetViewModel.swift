//
//  PersonSetViewModel.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit

class PersonSetViewModel{
    
    var personSet:[Person] = []
    
    init(personSet: PersonSet){
        for person in personSet.personList{
            self.personSet.append(person)
        }
    }
    
    init(){
        self.personSet = []
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
        print("hello")
        if name == nil {
            print("oups")
            return
        }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let person = Person(context: context)
        person.name = name
        do{
            try context.save()
            print("save")
            //self.trips.append(trip)
        }
        catch let error as NSError{
            print(error)
        }
        print("insert done")
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
