//
//  RecipeIngredients.swift
//  Dinnergy
//
//  Created by Tara Sankhalpara on 14/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import Foundation

class RecipeIngredients {
    
    var id: Int
    var recipe_id: Int
    var name: String
    var quantity: Double
    var unit: String
    
    init(id: Int, recipe_id: Int, name: String, quantity: Double, unit: String){
        self.id = id
        self.recipe_id = recipe_id
        self.name = name
        self.quantity = quantity
        self.unit = unit
    }
}
