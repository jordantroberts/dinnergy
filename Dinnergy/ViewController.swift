import UIKit
import SQLite3

let instanceDB = DinnergyDB()

class ViewController: UIViewController {

    @IBOutlet weak var labelIngredient: UITextField!
    @IBOutlet weak var labelQuantity: UITextField!
    @IBOutlet weak var labelUnit: UITextField!

    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Successfully Added", message:
            "This item has been added to your ingredients list", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        self.labelIngredient.text = ""
        self.labelQuantity.text = ""
        self.labelUnit.text = ""
        
    }
    @IBAction func buttonTap(_ sender: UIButton) {

        instanceDB.insertIngredients(name: labelIngredient.text ?? "", quantity: Double(labelQuantity.text ?? "") ?? 0, unit: labelUnit.text ?? "")

    }

}
