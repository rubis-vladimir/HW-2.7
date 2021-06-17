//
//  DetailPersonViewController.swift
//  contactList
//
//  Created by Владимир Рубис on 10.06.2021.
//

import UIKit

class DetailPersonViewController: UIViewController {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var labelPersonEmail: UILabel!
    @IBOutlet weak var labelPersonPhone: UILabel!
    
    var person: Person!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.image = UIImage(named: "back3")
        labelPersonEmail.text = person.email
        labelPersonPhone.text = person.phone
        personImage.layer.borderWidth = 6
        personImage.layer.borderColor = UIColor.gray.cgColor
        
        if person.image == nil {
            personImage.image = UIImage(named: person.photo ?? "")
        } else {
            personImage.image = person.image
        }
    }
    
    
}
