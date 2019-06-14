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
    let stock = instanceDB.checkStock()

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stock.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        cell.textLabel?.text = stock[indexPath.row].name + ": " + String(stock[indexPath.row].quantity) + " " + stock[indexPath.row].unit

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Current Stock:"
    }



}
