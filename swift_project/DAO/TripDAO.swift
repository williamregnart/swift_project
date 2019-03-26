//
//  File.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TripDAO {
    static let request : NSFetchRequest<Trip_Data> = Trip_Data.fetchRequest()
    static func save(){
        CoreDataManager.save()
    }
    static func delete(trip: Trip_Data){
        CoreDataManager.context.delete(trip)
    }
    static func fetchAll() -> [Trip_Data]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        } }
    static func search(forTrip trip: String?) -> Trip_Data?{
        if let trip = trip{
            self.request.predicate = NSPredicate(format: "nameTrip == %@", trip)
        }
        do{
            let result = try CoreDataManager.context.fetch(request) as [Trip_Data]
            guard result.count != 0 else { return nil }
            guard result.count == 1 else { fatalError("duplicate entries") }
            return result[0]
        } catch{
            return nil
        } }
}
