//
//  ShowTripViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowTripViewController: UIViewController,UITextFieldDelegate {

    var trip: Trip? = nil
    @IBOutlet weak var nameTrip: UILabel!
    @IBOutlet weak var personsTable: UITableView!
    
    var persons:PersonSetViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let aTrip = self.trip{
            nameTrip.text = aTrip.name
        }

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPerson"){
            if let indexPath = self.personsTable.indexPathForSelectedRow{
                let showPersonViewController = segue.destination as! ShowPersonViewController
                showPersonViewController.person = self.persons?.getPersonByIndex(index: indexPath.row)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
