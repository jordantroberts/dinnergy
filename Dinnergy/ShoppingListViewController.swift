import UIKit

class ShoppingListViewController: UITableViewController {

    var stmt:OpaquePointer?
    var list = instanceDB.showList()
    
    override func viewWillAppear(_ animated: Bool) {
        list = instanceDB.showList()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListLabelCell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row].name + ": " + String(list[indexPath.row].quantity) + " " + list[indexPath.row].unit
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Shopping List:"
    }
    
    @IBAction func clearList(_ sender: Any) {
        instanceDB.dropListTable()
        instanceDB.createListsTable()
        navigationController?.popViewController(animated: true)
        list = instanceDB.showList()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let name = list[indexPath.row].name
            instanceDB.deleteListItem(name: name)
            
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            
        }
    }
}
