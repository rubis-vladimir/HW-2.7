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
        
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension PersonListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = personList[indexPath.section]
        cell.textLabel?.text = indexPath.row == 0 ? person.email : person.phone
        cell.textLabel?.font = UIFont(name: "Avenir", size: 17)
        cell.imageView?.image = indexPath.row == 0 ? UIImage(systemName: "phone") : UIImage(systemName: "tray")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personList[section].fullname
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentPerson = personList.remove(at: sourceIndexPath.row)
        personList.insert(currentPerson, at: destinationIndexPath.row)
    }
    
    // MARK:  - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .insert
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.orange
        headerView.textLabel?.textAlignment = .center
        headerView.textLabel?.font = UIFont(name: "Avenir", size: 20.0)
    }
}

