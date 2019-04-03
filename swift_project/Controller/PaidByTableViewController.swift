//
//  PaidByTableViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class PaidByTableViewController: UITableViewController {
    
    var expense: Expense!
    
    var inputPerson: Person!
    
    var trip: TripViewModel!

    var personTable : [Person] = []
    
    
    var cells: [PersonWhoPaidTableViewCell] = []
    
    var amountChecked : [Double] = []
    
    func getPersonsChecked()->[PersonWhoPaidTableViewCell]{
        var result: [PersonWhoPaidTableViewCell] = []
        for cell in paidByTable.visibleCells{
            let cell = cell as! PersonWhoPaidTableViewCell
            if(cell.checkButton.isChecked){
                result.append(cell)
            }
            
        }
        return result
    }
    
    

    
    @IBOutlet weak var paidByTable: UITableView!
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
        return trip.persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.paidByTable.dequeueReusableCell(withIdentifier: "personWhoPaidCell", for: indexPath) as! PersonWhoPaidTableViewCell
        cell.personName.text = self.trip.getPersonByIndex(index: indexPath.row)?.name
        cell.index = indexPath.row
        cell.person = self.trip.getPersonByIndex(index: indexPath.row)
        if (expense != nil){
            let person = expense.epersonsWhoPaid.look(person: cell.person)
            cell.amount.text = String(person!.amount)
            if(person != nil){
                cell.checkButton.isChecked = true
            }
        }
        
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
