//
//  ViewController.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tripCont : tripContainerController
    
    
    @IBOutlet weak var titleApp: UILabel!
    
    @IBOutlet weak var tripTable: UITableView!
    var trips: TripSetViewModel2 = TripSetViewModel2(tripSet: TripSet(trips: []))
    
    
    required init?(coder decoder: NSCoder) {
        //self.tripCont = tripContainerController()
        self.tripCont = tripContainerController(coder: decoder)!
        super.init(coder: decoder)
        
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trips.tripSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tripTable.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripTableViewCell
        cell.voyage.text = self.trips.getTripByIndex(index: indexPath.row)?.name
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard self.getContext(errorMsg: "Save failed") != nil else {return}
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func alertError(errorMsg error : String, userInfo user: String = ""){
        let alert = UIAlertController(title: error, message: user, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:"OK",style:.default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    func alert(WithTitle title: String, andMessage msg: String = ""){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:"OK",style:.default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    
    @IBAction func unwindAfterSaveTrip(segue: UIStoryboardSegue){
        let containerTripController = segue.source as! tripContainerController
        if let name = containerTripController.nameTextField.text{
            containerTripController.newTrip.saveNewTrip(Name: name, Image: nil, Date_begin: nil, Date_end: nil)
            self.tripTable.reloadData()
        }
    }
    
    func getContext(errorMsg: String, userInfoMsg: String = "could not retrieve data context") -> NSManagedObjectContext?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            self.alert(WithTitle: errorMsg, andMessage: userInfoMsg)
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tripDetails"{
            if let indexPath = self.tripTable.indexPathForSelectedRow{
                let showTripViewController = segue.destination as! ShowTripViewController
                showTripViewController.trip = self.trips.getTripByIndex(index: indexPath.row)
            }
        }
        
    }

    
    @IBAction func addTrip(_ sender: Any) {
        //tripCont.viewWillAppear(true, type: "Création")
        performSegue(withIdentifier: "newTrip", sender: sender)
    }
    
}

