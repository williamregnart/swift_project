//
//  ViewController.swift
//  swift_project
//
//  Created by William REGNART on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var titleApp: UILabel!
    
    @IBOutlet weak var tripTable: UITableView!
    var trips:[Trip]=[]
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tripTable.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripTableViewCell
        cell.voyage.text = self.trips[indexPath.row].name
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
        let newTripController = segue.source as! NewTripViewController
        if let name = newTripController.nameInput.text{
            newTripController.saveNewTrip(Name: name, Image: nil, Date_begin: nil, Date_end: nil)
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
                showTripViewController.trip = self.trips[indexPath.row]
            }
        }
        
    }


}

