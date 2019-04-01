//
//  TripViewModel.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 28/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit

class TripViewModel{
    
    var trip: Trip
    var name:String
    var image: UIImage?
    var persons: [Person] = []
    var date_creation:Date
    var date_begin:Date?
    var date_end:Date?
    
    init(trip: Trip){
        self.trip = trip
        self.name = trip.name ?? ""
        self.image = trip.timage
        for person in trip.persons{
            self.persons.append(person)
        }
        self.date_creation = trip.date_creation!
        self.date_begin = trip.date_begin
        self.date_end = trip.date_end
        
    }
    
    func getPersonByIndex(index: Int?) -> Person?{
        if let i = index {
            if i>=0 && i<self.persons.count {
                return self.persons[i]
            }
        }
        return nil
    }
    
    static func == (t1 : TripViewModel,t2 : TripViewModel)->Bool{
        return t1.name == t2.name
    }
    
    func addPerson(person: Person){
        persons.append(person)
        trip.addPerson(p: person)
        TripDAO.save()
        
    }
    
    func editTrip(name: String?,image: UIImage?,date_begin: Date?,date_end: Date?){
        self.name = name ?? self.name
        self.image = image ?? self.image
        self.date_begin = date_begin ?? self.date_begin
        self.date_end = date_end ?? self.date_end
        self.trip.editTrip(name: name,image: image,date_begin: date_begin,date_end: date_end)
        TripDAO.save()
    }
}
