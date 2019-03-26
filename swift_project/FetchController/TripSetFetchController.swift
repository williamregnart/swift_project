//
//  TripSetFetchController.swift
//  swift_project
//
//  Created by Antoine SANCHEZ on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TripSetFetchController: NSObject, NSFetchedResultsControllerDelegate {
    let tripTableView : UITableView
    
    init(view: UITableView){
        self.tripTableView = view
        super.init()
        do{
            try self.tripsFetched.performFetch()
        } catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    lazy var tripsFetched : NSFetchedResultsController<Trip> {
        
    }
    
    
}
