//
//  ShowPersonViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 27/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowPersonViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var namePersonLabel: UILabel!
    
    var person: Person? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let aperson = self.person{
            namePersonLabel.text = aperson.name
        }

        // Do any additional setup after loading the view.
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
