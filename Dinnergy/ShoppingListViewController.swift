//
//  ShoppingListViewController.swift
//  Dinnergy
//
//  Created by Oliver Cripps on 18/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit

class ShoppingListViewController: UITableViewController {

   
    // MARK: - Table view data source
    var stmt:OpaquePointer?
    var list = instanceDB.showList()
    
    override func viewWillAppear(_ animated: Bool) {
        list = instanceDB.showList()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListLabelCell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row].name + ": " + String(list[indexPath.row].quantity) + " " + list[indexPath.row].unit
        // might be helpful to add columns to display data more consistanly across the screen and update table header to include: name, quantity, and unit (function below)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Shopping List:"
    }
    
    
    @IBAction func clearList(_ sender: Any) {
        instanceDB.dropListTable()
        instanceDB.createListsTable()
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if (editingStyle == .delete) {
//            let name = list[indexPath.row].name
//            instanceDB.deleteItem(name: name)
//
//            list.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
//        }
//    }

}
