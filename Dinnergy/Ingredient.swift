//
//  Ingredient.swift
//  Dinnergy
//
//  Created by Simon 易 on 12/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import Foundation

class Ingredient {
    
    var id: Int
    var name: String
    var quantity: Double
    var unit: String
    
    init(id: Int, name: String, quantity: Double, unit: String){
        self.id = id
        self.name = name
        self.quantity = quantity
        self.unit = unit
    }
}
