//
//  ViewController.swift
//  Dinnergy
//
//  Created by Jordan Roberts on 11/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    
    var instanceDB = DinnergyDB()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let instance = DinnergyDB()
        instance.updateStock(name: "Egg", quantity: 5 )
        instance.deleteItem(name: "uni")
        instance.checkStock()
        
    }

    @IBOutlet weak var textFieldIngredient: UITextField!
    @IBOutlet weak var textFieldQuantity: UITextField!
    @IBOutlet weak var textFieldUnit: UITextField!
    
    @IBAction func buttonTap(_ sender: UIButton) {
        
       let str  = textFieldQuantity.text ?? ""
       let number:Int32 = Int32(str) ?? 0
      
        
        instanceDB.insertIngredients(name: "\(textFieldIngredient)", quantity: number, unit: "\(textFieldUnit)")
        
    }
    
}

