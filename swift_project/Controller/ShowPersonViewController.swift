//
//  ShowPersonViewController.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowPersonViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var creanceTable: UITableView!
    @IBOutlet weak var debtTable: UITableView!
    @IBOutlet weak var namePersonLabel: UILabel!
    @IBOutlet weak var personBalanceLabel: UILabel!

    var person: PersonViewModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if let aperson = self.person{
            namePersonLabel.text = aperson.name
            personBalanceLabel.text = "Balance : " + String(format : "%.2f", aperson.person.balance)
        }

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    //Fills tables with the right infos according to which table they are
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == debtTable{
            let cell = self.debtTable.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! DebtTableViewCell
            cell.concernedExpense.text = self.person?.getDebtByIndex(index: indexPath.row)?.ename
            cell.amount.text = String(format : "%.2f", self.person?.getDebtByIndex(index: indexPath.row)?.amount ?? 0)
            return cell
        }
        else{
            let cell = self.creanceTable.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! CreanceTableViewCell
            cell.expenseConcerned.text = self.person?.getCreanceByIndex(index: indexPath.row)?.ename
            cell.amount.text = String(format : "%.2f", self.person?.getCreanceByIndex(index: indexPath.row)?.amount ?? 0)
            return cell
        }
    }

    //Allows the user to go back to previous page
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
