//
//  IngredientsTableViewController.swift
//  Dinnergy
//
//  Created by Simon 易 on 13/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    

    // MARK: - Table view data source
    var stmt:OpaquePointer?
    var stock = instanceDB.checkStock()
    
    override func viewWillAppear(_ animated: Bool) {
        stock = instanceDB.checkStock()
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stock.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        cell.textLabel?.text = stock[indexPath.row].name + ": " + String(stock[indexPath.row].quantity) + " " + stock[indexPath.row].unit
        // might be helpful to add columns to display data more consistanly across the screen and update table header to include: name, quantity, and unit (function below)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Current Stock:"
    }



}
