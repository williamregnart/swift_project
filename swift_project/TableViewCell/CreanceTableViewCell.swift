//
//  CreanceTableViewCell.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class CreanceTableViewCell: UITableViewCell {

    @IBOutlet weak var expenseConcerned: UILabel!
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
