import UIKit

class IngredientsTableViewController: UITableViewController {
    
    var stmt:OpaquePointer?
    var stock = instanceDB.checkStock()
    
    override func viewWillAppear(_ animated: Bool) {
        stock = instanceDB.checkStock()
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stock.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        cell.textLabel?.text = stock[indexPath.row].name + ": " + String(stock[indexPath.row].quantity) + " " + stock[indexPath.row].unit
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Current Stock"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let name = stock[indexPath.row].name
            instanceDB.deleteItem(name: name)
            
            stock.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
}
