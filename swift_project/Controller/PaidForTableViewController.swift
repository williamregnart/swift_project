//
//  PaidForTableViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 03/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class PaidForTableViewController: UITableViewController {

    @IBOutlet weak var paidForTable: UITableView!
    var trip: TripViewModel!
    
    var personTable : [Person] = []
    
    func getPersonsChecked()->[Person]{
        var result: [Person] = []
        for cell in paidForTable.visibleCells{
            let cell = cell as! PersonWhoHaveToPayTableViewCell
            if(cell.checkButton.isChecked){
                result.append(personTable[cell.index])
            }
            
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trip.persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personWhoHaveToPayCell", for: indexPath) as! PersonWhoHaveToPayTableViewCell

        cell.personName.text = trip.getPersonByIndex(index: indexPath.row)?.name
        cell.person = trip.getPersonByIndex(index: indexPath.row)
        cell.index = indexPath.row
        return cell
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
