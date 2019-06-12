//
//  ViewController.swift
//  Dinnergy
//
//  Created by Jordan Roberts on 11/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let instance = DinnergyDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        instance.updateStock(name: "Egg", quantity: 5 )
//        instance.deleteItem(name: "uni")
        instance.checkStock()
        
    }


}

