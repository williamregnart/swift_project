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
    
    static let request :NSFetchRequest<Trip> = Trip.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(trip: Trip){
        CoreDataManager.context.delete(trip)
    }
    
    static func insert(trip: Trip){
        CoreDataManager.context.insert(trip)
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
}
