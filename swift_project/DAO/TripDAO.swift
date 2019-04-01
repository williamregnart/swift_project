//
//  TripDAO.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 29/03/2019.
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
        let tripData = Trip(context: CoreDataManager.context)
        tripData.name = trip.name
        tripData.date_creation = trip.date_creation
        tripData.date_begin = trip.date_begin
        tripData.date_end = trip.date_end
        CoreDataManager.context.insert(trip)
        self.save()
    }
    
    static func update(trip: Trip, name: String){
        CoreDataManager.context.setValue(name, forKey: "name")
        self.save()
    }
    
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
    
    static func getPersons(trip : Trip)-> [Person]{
        return trip.hasPerson?.allObjects as! [Person]
    }
}
