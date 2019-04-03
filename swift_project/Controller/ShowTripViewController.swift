//
//  ShowTripViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowTripViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {

    var inputPerson: UITextField!
    
    @objc
    func addPerson(_ sender: Any) {
        let p = Person(name: self.inputPerson.text!)
        trip?.addPerson(person: p)
        persons.append(p)
        self.personsTable.reloadData()
    }
    var trip: TripViewModel? = nil
    @IBOutlet weak var nameTrip: UILabel!
    @IBOutlet weak var imageTrip: UIImageView!
    @IBOutlet weak var personsTable: UITableView!
    
    var persons:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let aTrip = self.trip{
            nameTrip.text = aTrip.name
            imageTrip.image = aTrip.image
            persons = aTrip.persons
        }

        // Do any additional setup after loading the view.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section==0){
            return 1
        }
        else{
            return self.trip?.persons.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section==0){
            let cell = self.personsTable.dequeueReusableCell(withIdentifier: "addPersonCell", for: indexPath) as! AddPersonTableViewCell
            cell.actionButton.addTarget(self, action: #selector(addPerson), for: .touchUpInside)
            inputPerson = cell.nameInput
            return cell
        }
        else{
            let cell = self.personsTable.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
            cell.personName.text = self.trip?.getPersonByIndex(index: indexPath.row)?.name
            cell.personAmount.text = String(format : "%f", self.trip?.getPersonByIndex(index: indexPath.row)?.balance ?? 0)
            return cell
        }
    }
    
    @IBAction func unwindAfterEditTrip(segue: UIStoryboardSegue){
        let editTripController = segue.source  as! EditTripViewController
        if let name = editTripController.nameInput.text{
            self.editTrip(name: name, image: nil, date_begin: nil, date_end: nil)
        }

    }
    
    func editTrip(name:String?,image:UIImage?,date_begin:Date?,date_end:Date?){
        trip?.editTrip(name: name,image: image,date_begin: date_begin,date_end: date_end)
        self.nameTrip.text = name ?? self.nameTrip.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPerson"){
            if let indexPath = self.personsTable.indexPathForSelectedRow{
                let showPersonViewController = segue.destination as! ShowPersonViewController
                showPersonViewController.person?.person = (self.trip!.getPersonByIndex(index: indexPath.row))!
            }
        }
        if segue.identifier == "showExpenses"{
            let expensesViewController = segue.destination as! ExpensesViewController
            expensesViewController.trip = self.trip
            expensesViewController.expenses = self.trip?.expenses
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
