//
//  AddPersonTableViewCell.swift
//  swift_project
//
//  Created by WILLIAM REGNART on 29/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class AddPersonTableViewCell: UITableViewCell, UITextFieldDelegate {


    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var actionButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK - TextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
