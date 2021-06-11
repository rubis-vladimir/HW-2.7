//
//  PersonListViewController.swift
//  contactList
//
//  Created by Владимир Рубис on 11.06.2021.
//

import UIKit

class PersonListViewController: UITableViewController {
    
    var personList: [Person]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension PersonListViewController {
    
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

extension PersonListViewController {

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

