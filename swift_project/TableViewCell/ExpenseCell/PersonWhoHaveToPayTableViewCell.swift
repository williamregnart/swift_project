//
//  PersonWhoHaveToPayTableViewCell.swift
//  swift_project
//
//  Created by WILLIAM REGNART on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class PersonWhoHaveToPayTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: CheckUIButton!
    @IBOutlet weak var personName: UILabel!
    var person: Person!

    var index: Int!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
