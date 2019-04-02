//
//  ShowPersonViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowPersonViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var creanceTable: UITableView!
    @IBOutlet weak var expenseTable: UITableView!
    @IBOutlet weak var namePersonLabel: UILabel!
    
    var person: PersonViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let aperson = self.person{
            namePersonLabel.text = aperson.name
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == expenseTable{
            let cell = self.expenseTable.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! ExpenseTableViewCell
            cell.expenseConcerned.text = self.person?.getDebtByIndex(index: indexPath.row)?.ename
            cell.expenseAmount.text = self.person?.getDebtByIndex(index: indexPath.row)?.amount as! String?
            return cell
        }
        else{
            let cell = self.expenseTable.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! CreanceTableViewCell
            cell.expenseConcerned.text = self.person?.getCreanceByIndex(index: indexPath.row)?.ename
            cell.amount.text = self.person?.getCreanceByIndex(index: indexPath.row)?.amount as! String?
            return cell
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
