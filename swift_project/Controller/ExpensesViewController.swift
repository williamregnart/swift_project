//
//  ExpensesViewController.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 01/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var expensesTable: UITableView!

    var trip: TripViewModel!

    var expenses: ExpenseSetViewModel!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.expenseSet.count
    }

    //Allows the user to go back to previous screen
    @IBAction func goToTrip(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    //Fills cells with their expense name and total amount (sum of amounts paid by each person paying)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.expensesTable.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! ExpenseTableViewCell
        cell.expenseConcerned.text = self.expenses.getExpenseByIndex(index: indexPath.row)!.ename
        cell.expenseAmount.text = String(self.expenses.getExpenseByIndex(index: indexPath.row)!.amount)
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    //Opens the expense creation view
    @IBAction func addExpense(_ sender: Any) {
        performSegue(withIdentifier: "newExpense", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Adds the current trip to the controller of next view
        if segue.identifier == "newExpense"{
            let addExpenseViewController = segue.destination as! AddExpenseViewController
            addExpenseViewController.trip = self.trip
        }
        //Alls the selected expense to the controller of next view
        if segue.identifier == "expenseDetails"{
            if let indexPath = self.expensesTable.indexPathForSelectedRow{
                let showExpenseDetailViewController = segue.destination as! ShowExpenseDetailViewController
                showExpenseDetailViewController.expense = self.expenses.getExpenseByIndex(index: indexPath.row)
            }
        }
    }

    //Catches the new expense and saves it
    @IBAction func unwindAfterSaveExpense(segue: UIStoryboardSegue){
        let addExpenseController = segue.source as! AddExpenseViewController
        self.saveNewExpense(addExpenseController: addExpenseController)
        performSegue(withIdentifier: "newExpense", sender: segue.source)
    }

    //Saves the new expense
    func saveNewExpense(addExpenseController: AddExpenseViewController){
        let expense = Expense(name: addExpenseController.expenseName.text!)
        let personsWhoPaid = addExpenseController.paidByTableController.getPersonsChecked()
        for c in personsWhoPaid{
            let expensePerson = ExpensePerson(person: c.person, amount: NumberFormatter().number(from: c.amount.text!) as! Double, expense: expense)
            print(expensePerson.amount)
            expense.addPersonWhoPaid(expensePerson: expensePerson)
            c.person.addToPayExpense(expensePerson)
        }
        for c in addExpenseController.paidForTable.getPersonsChecked(){
            expense.addToPaidFor(c)
            c.addToHasToPayExpense(expense)
        }
        self.expenses.addExpense(expense: expense)
        self.expensesTable.reloadData()


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
