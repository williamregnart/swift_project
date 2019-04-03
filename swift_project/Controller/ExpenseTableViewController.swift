//
//  CostTableViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ExpenseTableViewController: UITableViewController {
    
    @IBOutlet weak var expensesTable: UITableView!
    var expenses : ExpenseSetViewModel!
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func unwindAfterSaveExpense(segue: UIStoryboardSegue){
        let addExpenseController = segue.source as! AddExpenseViewController
        self.saveNewExpense(addExpenseController: addExpenseController)
        performSegue(withIdentifier: "addExpense", sender: segue.source)
    }
    
    func saveNewExpense(addExpenseController: AddExpenseViewController){
        let expense = Expense(name: addExpenseController.expenseName.text!)
        for c in addExpenseController.paidByTableController.cells{
            let expensePerson = ExpensePerson(person: c.person, amount: NumberFormatter().number(from: c.amount.text!) as! Double, expense: expense)
            expense.addToPaidBy(expensePerson)
            c.person.addToPayExpense(expensePerson)
        }
        for c in addExpenseController.paidForTable.getPersonsChecked(){
            expense.addToPaidFor(c)
            c.addToHasToPayExpense(expense)
        }
        self.expenses.


    }
    
    @IBAction func addExpense(_ sender: Any) {
        var personsWhoPaidCell: [PersonWhoPaidTableViewCell] = paidByTableController.getPersonsChecked()
        for c in personsWhoPaidCell{
            print(c.name)
        }
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
