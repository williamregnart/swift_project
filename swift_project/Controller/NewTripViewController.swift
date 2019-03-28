//
//  NewTripViewController.swift
//  swift_project
//
//  Created by William REGNART on 25/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class NewTripViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var date_begin_input: UIDatePicker!
    @IBOutlet weak var date_end_input: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK - TextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveNewTrip(Name:String,Image:UIImage?,Date_begin:Date?,Date_end:Date?){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let trip = Trip(context: context)
        trip.name = Name
        trip.date_creation = Date()
        trip.date_begin = Date_begin
        trip.date_end = Date_end
        do{
            try context.save()
            //self.trips.append(trip)
        }
        catch let error as NSError{
            //self.alertError(errorMsg: "\(error)",userInfo: "\(error.userInfo)")
        }
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
