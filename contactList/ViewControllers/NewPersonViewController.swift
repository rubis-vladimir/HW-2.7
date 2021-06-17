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
    
    @IBOutlet weak var personImage: UIImageView!
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
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
        } else {
            view.endEditing(true)
        }
    }
    
    func saveNewPerson() {
        
        var image: UIImage?
        
        if imageIsChanged {
            image = personImage.image
        } else {
            image = #imageLiteral(resourceName: "Plug")
        }
        newPerson = Person(name: personName.text!,
                           surname: personSurname.text,
                           email: personEmail.text,
                           phone: personPhone.text,
                           image: image,
                           photo: nil)
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

// MARK: - Work with Image

extension NewPersonViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        personImage.image = info[.editedImage] as? UIImage
        personImage.contentMode = .scaleAspectFill
        personImage.clipsToBounds = true

        imageIsChanged = true

        dismiss(animated: true)
    }
}
