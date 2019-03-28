//
//  ShowTripViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowTripViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {

    var trip: TripViewModel? = nil
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.personsTable.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
        cell.personName.text = self.persons?.getPersonByIndex(index: indexPath.row)?.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPerson"){
            if let indexPath = self.personsTable.indexPathForSelectedRow{
                let showPersonViewController = segue.destination as! ShowPersonViewController
                showPersonViewController.person?.person = (self.persons?.getPersonByIndex(index: indexPath.row))!
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
