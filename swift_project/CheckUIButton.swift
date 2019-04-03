//
//  ExpenseUIButton.swift
//  swift_project
//
//  Created by WILLIAM REGNART on 03/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

//Checkboxes
class CheckUIButton: UIButton {

    let checkedImage = UIImage(named: "check")! as UIImage
    let uncheckedImage = UIImage(named: "uncheck")! as UIImage

    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }

    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
