//
//  AddExpenseViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet var paidByTableController: PaidByTableViewController!
    var trip: TripViewModel!
    var paidByTableController: PaidByTableViewController = PaidByTableViewController()
    
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var personsWhoPaidTable: UITableView!
    @IBOutlet weak var personsWhoHaveToPayTable: UITableView!
    

    
    @IBOutlet var paidForTable: PaidForTableViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        paidByTableController.trip = self.trip
        paidByTableController.personTable = trip.persons
        paidForTable.trip = self.trip
        paidForTable.personTable = trip.persons
        // Do any additional setup after loading the view.
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
