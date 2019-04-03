//
//  showExpenseDetailViewController.swift
//  swift_project
//
//  Created by Antoine SANCHEZ on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit

class ShowExpenseDetailViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet var showPaidForTableController: ShowPaidForTableViewController!
    
    @IBOutlet var showPaidByTableController: ShowPaidByTableViewController!
    var expense: Expense!
    var trip: TripViewModel!
    
    @IBOutlet weak var expenseName: UITextField!
    
    @IBOutlet weak var expenseAmount: UILabel!

    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPaidByTableController.trip = self.trip
        showPaidByTableController.personTable = trip.persons
        showPaidForTableController.trip = self.trip
        showPaidForTableController.personTable = trip.persons
        // Do any additional setup after loading the view.
    }
    
}
