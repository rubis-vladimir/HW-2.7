//
//  PersonTableViewController.swift
//  contactList
//
//  Created by Владимир Рубис on 10.06.2021.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
    var personList = Person.getPersonList()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 50
    }
}

/// Mark: UITableViewDelegate
extension PersonTableViewController {
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .insert
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentPerson = personList.remove(at: sourceIndexPath.row)
        personList.insert(currentPerson, at: destinationIndexPath.row)
    }
}

extension PersonTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = personList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = person.fullname
        
        cell.contentConfiguration = content
        return cell
    }
}

/// Mark: Navigation actions
extension PersonTableViewController: UITabBarDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        guard let navigationVC = viewController as? UINavigationController else { return }
        if let personListVC = navigationVC.topViewController as? PersonListViewController {
            personListVC.personList = personList
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? DetailPersonViewController,
           let indexPath = tableView.indexPathForSelectedRow
        {
            let person = personList[indexPath.row]
            vc.person = person
        } else { return }
    }
}

