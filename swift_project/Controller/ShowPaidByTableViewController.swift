//
//  ShowPaidByTableViewController.swift
//  swift_project
//
//  Created by WILLIAM REGNART on 03/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowPaidByTableViewController: UITableViewController {

    var expense: Expense!

    var inputPerson: Person!

    var trip: TripViewModel!

    var personTable : [Person] = []


    var cells: [PersonWhoPaidTableViewCell] = []

    var amountChecked : [Double] = []

    @IBOutlet weak var showPaidByTable: UITableView!

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

    //fills cells with the right infos
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.showPaidByTable.dequeueReusableCell(withIdentifier: "showPersonWhoPaidCell", for: indexPath) as! ShowPersonWhoPaidTableViewCell
        cell.personName.text = self.trip.getPersonByIndex(index: indexPath.row)?.name
        cell.index = indexPath.row
        cell.person = self.trip.getPersonByIndex(index: indexPath.row)
        let person = expense.epersonsWhoPaid.look(person: cell.person)
        cell.amount.text = String(person!.amount)
        if(person != nil){
            cell.checkButton.isChecked = true
        }

        return cell
    }

}
