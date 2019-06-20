import UIKit

class SingleRecipeViewController: UIViewController {
    
    let recipe = instanceDB.showRecipes()
    let list = instanceDB

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = recipe[myIndex].name
        methodLabel.text = recipe[myIndex].method
        ingredientLabel.text = recipe[myIndex].ingredients
        myImageView.image = UIImage(named: recipe[myIndex].name + ".jpg")
    
    }

    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Added to List", message:
        "The ingredients for this recipe have been added to your shopping list", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addtoListButton(_ sender: UIButton) {
        let ingredientArrayForList = list.matchRecipeNameWithID(name: titleLabel.text!)
        list.insertList(recipeID: ingredientArrayForList)
    }
}
