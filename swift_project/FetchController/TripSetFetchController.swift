//
//  TripSetFetchController.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 26/03/2019.
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

    var tripsFetched : NSFetchedResultsController<Trip> {
        let request : NSFetchRequest<Trip> = Trip.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Trip.name), ascending: true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        return fetchResultController
    }

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tripTableView.beginUpdates()
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tripTableView.endUpdates()
        CoreDataManager.save()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at
        indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath{
                self.tripTableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath{
                self.tripTableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath{
                self.tripTableView.reloadRows(at: [indexPath], with: .automatic)
            } default:
            break
        } }


}
