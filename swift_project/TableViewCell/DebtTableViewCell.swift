//
//  DebtCell.swift
//  swift_project
//
//  Created by Antoine SANCHEZ on 03/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class DebtTableViewCell: UITableViewCell {
    
    @IBOutlet weak var concernedExpense: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
