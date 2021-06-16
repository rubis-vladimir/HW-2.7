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
        
        backgroundImage.image = UIImage(named:
            "background")
        labelPersonEmail.text = person.email
        labelPersonPhone.text = person.phone
        personImage.image = UIImage(named: person.photo ?? "")
        personImage.layer.borderWidth = 6
    }
    

}
