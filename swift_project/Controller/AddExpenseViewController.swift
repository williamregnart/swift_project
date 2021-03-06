//
//  AddExpenseViewController.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var paidByTableController: PaidByTableViewController!
    @IBOutlet var paidForTable: PaidForTableViewController!
    var trip: TripViewModel!

    @IBOutlet weak var expenseName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        paidByTableController.trip = self.trip
        paidByTableController.personTable = trip.persons
        paidForTable.trip = self.trip
        paidForTable.personTable = trip.persons
        // Do any additional setup after loading the view.
    }

    //Allows the user to go back to previous screen
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
