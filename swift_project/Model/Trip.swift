//
//  Trip.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Trip{

    var tname:String {return self.name ?? ""}
    var timage: UIImage? {
        get{if(self.image == nil){
            return UIImage(named: "img")
            }
            return UIImage(data: self.image!)}
        set{self.image = newValue?.pngData()}
    }
    var persons: PersonSet {
        let personList = PersonSet()
        for p in self.hasPerson!{
            personList.add(person: p as! Person)
        }
        return personList
    }

    var expenses: ExpenseSet {
        let expensesList = ExpenseSet()
        for e in self.hasExpense!{
            expensesList.add(expense: e as! Expense)
        }
        return expensesList
    }

    var tdate_creation:Date {return self.date_creation!}
    var tdate_begin:Date? {return self.date_begin}
    var tdate_end:Date? {return self.date_end}

    convenience init(name:String,image: UIImage?,date_begin: Date?,date_end: Date?){
        self.init(context: CoreDataManager.context)
        self.name=name
        guard image != nil else{
            self.image = UIImage(named: "img")?.pngData()
            return
        }
        self.image = image?.pngData()
        self.date_creation=Date()
    }

    /*
    func getPersons(){
        for p: Any in self.mutableArrayValue(forKey: "hasPerson"){
            if((p as! Person).belongsTo == self){
                persons.add(person: p as! Person)
            }
        }
    }
 */

    func addPerson(p : Person){
        persons.add(person: p)
        self.hasPerson?.adding(p)
        p.belongsTo = self
    }

    func editTrip(name: String?,image: UIImage?,date_begin: Date?,date_end: Date?){
        self.name = name ?? self.name
        self.image = image?.pngData() ?? self.image
        self.date_begin = date_begin ?? self.date_begin
        self.date_end = date_end ?? self.date_end
    }


}
