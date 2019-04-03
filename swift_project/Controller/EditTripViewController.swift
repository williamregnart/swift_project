//
//  EditTripViewController.swift
//  swift_project
//
//  Created by WILLIAM REGNART on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class EditTripViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var dateBegin: UIDatePicker!
    @IBOutlet weak var dateEnd: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //Allows the button to open the image gallery once pressed
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false

        self.present(image, animated: true){

        }
    }

    //Handles the selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myImageView.image = image
        } else {
            print("error : Image wasn't uploaded properly")
        }
        self.dismiss(animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //Allows the user to go back to previous screen
    @IBAction func cancel(_ sender: Any) {
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
