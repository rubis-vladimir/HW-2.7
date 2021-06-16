//
//  NewPersonViewController.swift
//  contactList
//
//  Created by Владимир Рубис on 16.06.2021.
//

import UIKit

class NewPersonViewController: UITableViewController {

    var imageIsChanged = false
    var newPerson: Person?
    
    @IBOutlet weak var saveTapped: UIBarButtonItem!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var personSurname: UITextField!
    @IBOutlet weak var personEmail: UITextField!
    @IBOutlet weak var personPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        
        personName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)

    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
    
    func saveNewPerson() {
        
        newPerson = Person(name: personName.text,
                           surname: personSurname.text,
                           email: personEmail.text,
                           phone: personPhone.text,
                           photo: "Plug")
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

// MARK: - Text field delegate

extension NewPersonViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        
        if personName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
