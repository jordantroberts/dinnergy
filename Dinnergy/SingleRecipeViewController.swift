//
//  SingleRecipeViewController.swift
//  Dinnergy
//
//  Created by Nandini Patel on 14/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit

class SingleRecipeViewController: UIViewController {
    
    let recipe = instanceDB.showRecipes()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    titleLabel.text = recipe[myIndex].name
    methodLabel.text = recipe[myIndex].method
    ingredientLabel.text = recipe[myIndex].ingredients
    
    }

}