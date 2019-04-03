//
//  ExpenseTableViewCell.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var expenseConcerned: UILabel!
    @IBOutlet weak var expenseAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
