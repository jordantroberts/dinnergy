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
    @IBOutlet weak var methodLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    titleLabel.text = recipe[myIndex].name
    methodLabel.text = recipe[myIndex].method
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
