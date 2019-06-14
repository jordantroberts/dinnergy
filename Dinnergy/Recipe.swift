//
//  Recipe.swift
//  Dinnergy
//
//  Created by Tara Sankhalpara on 14/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import Foundation

class Recipe {
    
    var id: Int
    var name: String
    var ingredients: String
    var method: String
    var attachment: String
    
    init(id: Int, name: String, ingredients: String, method: String, attachment: String){
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.method = method
        self.attachment = attachment
    }
}
