//
//  PaidByTableViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class PaidByTableViewController: UITableViewController {
    
    var inputPerson: Person!
    
    var trip: TripViewModel!

    var personTable : [Person] = []
    
    var costPersonTable : [CostPerson] = []
    
    var amountInput: UITextField!
    
    @objc
    func addPersonWhoPaid(_ sender: Any) {
        personTable.append(inputPerson)
        self.paidByTable.reloadData()
    }
    
    @IBOutlet weak var paidByTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        personTable = trip.persons

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section==0){
            return 1
        }
        else{
            return personTable.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section==0){
            let cell = self.paidByTable.dequeueReusableCell(withIdentifier: "addPersonWhoPaidCell", for: indexPath) as! AddPersonWhoPaidTableViewCell
            cell.actionButton.addTarget(self, action: #selector(addPersonWhoPaid), for: .touchUpInside)
            amountInput = cell.amount
            cell.persons = trip.persons
            return cell
        }
        else{
            let cell = self.paidByTable.dequeueReusableCell(withIdentifier: "personWhoPaidCell", for: indexPath) as! PersonWhoPaidTableViewCell
            cell.personName.text = self.personTable[indexPath.row].name
            return cell
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
