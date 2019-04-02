//
//  AddPersonWhoHaveToPayTableViewCell.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 02/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class AddPersonWhoHaveToPayTableViewCell: UITableViewCell {

    @IBOutlet weak var personPicker: UIPickerView!
    @IBOutlet weak var actionButton: UIButton!
    
    var persons : [Person] = []
    
    var personSelected : Person!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return persons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return persons[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.personSelected = self.persons[row]
        self.personPicker.isHidden = true
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
