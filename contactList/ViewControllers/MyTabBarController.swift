//
//  MyTabBarController.swift
//  contactList
//
//  Created by Владимир Рубис on 11.06.2021.
//

import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var personList = Person.getPersonList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make self the UITabBarControllerDelegate
        self.delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let vc = viewController as? PersonTableViewController {
            vc.personList = personList
            return
        }
        
        if let vc = viewController as? PersonListViewController {
            vc.personList = personList
            return
        }
        
    }
    
}
