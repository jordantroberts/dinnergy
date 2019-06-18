//
//  RecipeIngredientsViewController.swift
//  Dinnergy
//
//  Created by Nandini Patel on 18/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit

class RecipeIngredientsViewController: UITableViewController {

    var stmt:OpaquePointer?
    var list = instanceDB.showRecipeIngredients()

    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recipe Ingredients"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        list = instanceDB.showRecipeIngredients()
        self.tableView.reloadData()
    }
    
}


