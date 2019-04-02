//
//  ExpensesViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 01/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var expensesTable: UITableView!
    
    var trip: TripViewModel!
    
    var expenses: ExpenseSetViewModel = ExpenseSetViewModel()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trip.expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.expensesTable.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! ExpenseTableViewCell
        cell.expenseConcerned.text = self.expenses.getExpenseByIndex(index: indexPath.row)?.ename
        cell.expenseAmount.text = self.expenses.getExpenseByIndex(index: indexPath.row)?.amount as! String?
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    /*@IBAction func unwindAfterSaveExpense(segue: UIStoryboardSegue){
        let newExpenseController = segue.source as! NewExpenseViewController
        self.saveNewExpense(cname: newExpenseController.cname, personsWhoPaid: newExpenseController.personsWhoPaid, personsWhoHaveToPay: newExpenseController.personsWhoHaveToPay)
        }
        performSegue(withIdentifier: "newExpense", sender: segue.source)
    }
 
     func saveNewExpense(cname: String,personsWhoPaid: ExpensePersonSetViewModel, personsWhoHaveToPay: PersonSetViewModel){
     let trip = Trip(name: Name, image: Image, date_begin: Date_begin, date_end: Date_end)
     trips.addTrip(trip: trip)
     tripTable.reloadData()
     }
 */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "ExpenseDetails"{
             if let indexPath = self.expensesTable.indexPathForSelectedRow{
                 let showExpenseViewController = segue.destination as! ShowExpenseViewController
                 showExpenseViewController.expense = self.expenses.getExpenseByIndex(index: indexPath.row)
             }
        }
     }
     
    */

}
