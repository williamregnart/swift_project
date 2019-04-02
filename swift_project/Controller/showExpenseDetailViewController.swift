//
//  showExpenseDetailViewController.swift
//  swift_project
//
//  Created by Antoine SANCHEZ on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit

class showExpenseDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var personsWhoWerePaidFor: UITableView!
    
    @IBOutlet weak var personsWhoPaid: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
