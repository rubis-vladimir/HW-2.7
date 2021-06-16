//
//  NewPersonViewController.swift
//  contactList
//
//  Created by Владимир Рубис on 16.06.2021.
//

import UIKit

class NewPersonViewController: UITableViewController {

    var newPerson: Person?
    
    @IBOutlet weak var saveTapped: UIBarButtonItem!
    
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var personSurname: UITextField!
    @IBOutlet weak var personEmail: UITextField!
    @IBOutlet weak var personPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func saveNewPerson() {
        
//        var image: UIImage?
//
//        if imageIsChanged {
//            image = placeImage.image
//        } else {
//            image =
//        }
        
        newPerson = Person(name: personName.text,
                           surname: personSurname.text,
                           email: personEmail.text,
                           phone: personPhone.text,
                           photo: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
