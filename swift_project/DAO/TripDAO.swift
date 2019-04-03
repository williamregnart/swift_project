//
//  TripDAO.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 29/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData

class TripDAO{

    static let request : NSFetchRequest<Trip> = Trip.fetchRequest()

    static func save(){
        CoreDataManager.save()
    }

    static func delete(trip: Trip){
        CoreDataManager.context.delete(trip)
        self.save()

    }

    static func insert(trip: Trip){
        self.save()
    }

    static func update(trip: Trip, name: String){
        CoreDataManager.context.setValue(name, forKey: "name")
        self.save()
    }

    //adds a person to a trip
    static func insertPerson(trip: Trip, person: Person){
        CoreDataManager.context.setValue(person, forKey: "belongsTo")
    }

    static func getAllTrip() -> [Trip]{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return []
        }
    }

    //gets persons of a trip
    static func getPersons(trip : Trip)-> [Person]{
        return trip.hasPerson?.allObjects as! [Person]
    }
}
