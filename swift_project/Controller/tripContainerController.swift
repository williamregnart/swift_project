//
//  tripContainerController.swift
//  swift_project
//
//  Created by Antoine SANCHEZ on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit

class tripContainerController: UIViewController {
    
    required init?(coder aDecoder: NSCoder, type: String) {
        super.init(coder: aDecoder)
        viewWillAppear(true, type: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var beginDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var validateName: UIBarButtonItem!
    
    @IBAction func addImage(_ sender: Any) {
    }
    @IBAction func tripValidation(_ sender: Any) {
    }
    @IBAction func tripCancel(_ sender: Any) {
    }
    
    func viewWillAppear(_ animated: Bool, type: String) {
        navigationItem.title = type
    }
}
