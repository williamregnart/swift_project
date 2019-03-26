//
//  PersonSetViewModel.swift
//  swift_project
//
//  Created by Antoine SANCHEZ on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol TripSetViewModelDelegate {
    
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a Person is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func tripDeleted(at indexPath: IndexPath)
    /// called when a Person is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func tripUpdated(at indexPath: IndexPath)
    /// called when a Person is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func tripAdded(at indexPath: IndexPath)
}
//----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------
// MARK: -

class TripSetViewModel {
    // MARK: -
    var delegate : TripSetViewModelDelegate? = nil
    
    var tripsFetched : NSFetchedResultsController<Trip_Data>
    init(data: NSFetchedResultsController<Trip_Data>){
        self.tripsFetched = data
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new person in set of persons
    ///
    /// - Parameter person: Person to be added
    public func add(trip: Trip_Data){
        if let indexPath = self.tripsFetched.indexPath(forObject: trip){
            self.delegate?.tripAdded(at: indexPath)
        }
    }
    
    public var count : Int {
        return self.tripsFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(tripAt index: Int) -> Trip_Data?{
        return self.tripsFetched.object(at: IndexPath(row: index, section: 0))
    }
    
}
