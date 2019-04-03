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
    
    var trip: TripViewModel!
    
    @IBOutlet weak var expenseName: UITextField!
    
    @IBOutlet weak var expenseAmount: UILabel!
    
    @IBOutlet var paidForTableController: PaidForTableViewController!
    
    @IBOutlet var paidByTableController: PaidByTableViewController!
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paidByTableController.trip = self.trip
        paidByTableController.personTable = trip.persons
        paidForTableController.trip = self.trip
        paidForTableController.personTable = trip.persons
        // Do any additional setup after loading the view.
    }
    
}
