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

        instanceDB.updateStock(name: "Egg", quantity: 5 )
        instanceDB.deleteItem(name: "uni")
        instanceDB.checkStock()

    }

    @IBOutlet weak var labelIngredient: UITextField!
    @IBOutlet weak var labelQuantity: UITextField!
    @IBOutlet weak var labelUnit: UITextField!

    @IBAction func buttonTap(_ sender: UIButton) {

        let str  = labelQuantity.text ?? ""
        let number = Double(str) ?? 0
        let name = labelIngredient.text ?? ""
        let unit = labelUnit.text ?? ""

        instanceDB.insertIngredients(name: name, quantity: number, unit: unit)

    }
}
