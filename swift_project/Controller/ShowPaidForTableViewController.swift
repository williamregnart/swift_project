//
//  ShowPaidForTableViewController.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 03/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowPaidForTableViewController: UITableViewController {

    @IBOutlet weak var showPaidForTable: UITableView!
    var trip: TripViewModel!
    var expense: Expense!

    var personTable : [Person] = []


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

    //Fills the cells with the right infos
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showPersonWhoHaveToPayCell", for: indexPath) as! ShowPersonWhoHaveToPayTableViewCell

        cell.personName.text = trip.getPersonByIndex(index: indexPath.row)?.name
        cell.person = trip.getPersonByIndex(index: indexPath.row)
        cell.index = indexPath.row
        let person = expense.epersonsConcerned.look(person: cell.person)
        if(person != nil){
            cell.checkButton.isChecked = true
        }

        return cell
    }
}
