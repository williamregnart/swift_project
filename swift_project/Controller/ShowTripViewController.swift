//
//  ShowTripViewController.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class ShowTripViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @objc
    func addPerson(_ sender: Any) {
        guard let namePerson = self.getNameInput(personsTable, cellForRowAt: IndexPath()) else {
            return
        }
        print(namePerson)
        let p = Person(name: namePerson)
        trip?.addPerson(person: p)
        self.personsTable.reloadData()
    }
    var trip: TripViewModel? = nil
    @IBOutlet weak var nameTrip: UILabel!
    @IBOutlet weak var imageTrip: UIImageView!
    @IBOutlet weak var personsTable: UITableView!
    
    var persons:PersonSetViewModel = PersonSetViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let aTrip = self.trip{
            nameTrip.text = aTrip.name
            imageTrip.image = aTrip.image
        }

        // Do any additional setup after loading the view.
    }
    
    func getNameInput(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> String? {
        if(indexPath.row==0){
            let cell = self.personsTable.dequeueReusableCell(withIdentifier: "addPersonCell") as! AddPersonTableViewCell
            return cell.nameInput.text
        }
        else{
            return ""
        }
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
            return cell
        }
        else{
            let cell = self.personsTable.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
            cell.personName.text = self.trip?.getPersonByIndex(index: indexPath.row)?.name
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
                showPersonViewController.person?.person = (self.persons.getPersonByIndex(index: indexPath.row))!
            }
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
