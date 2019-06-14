//
//  RecipeTableViewController.swift
//  Dinnergy
//
//  Created by Tara Sankhalpara on 14/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController {

    var stmt:OpaquePointer?
    let recipe = instanceDB.showRecipes()
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

         cell.textLabel?.text = recipe[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recipes"
    }

    
}
