import UIKit

var myIndex = 0

class RecipeTableViewController: UITableViewController {

    var stmt: OpaquePointer?
    var recipe = instanceDB.showRecipes()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = recipe[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recipes"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recipe = instanceDB.showRecipes()
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "single", sender: self)
    }
}
