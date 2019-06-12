//
//  DinnergyDB .swift
//  Dinnergy
//
//  Created by Simon 易 on 11/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//
import UIKit
import SQLite3

var db: OpaquePointer?

class DinnergyDB {
    
     init()  {
        let fileURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("dinnergy.sqlite")
        
        
        if sqlite3_open(fileURL!.path, &db) != SQLITE_OK {
            print("ERROR opening database")
            return
        }else{
            print("SUCCESS opening database")
        }
        
        createTable()
        
    }
    
    func createTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Ingredients (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity INTEGER, unit TEXT)"

        if sqlite3_exec(db,createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")

        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }
    
    func createRecipeTable(){
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, method TEXT , attachment TEXT)"
        
        if sqlite3_exec(db,createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }
    
    func createRecipeIngredientsTable(){
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Recipe_Ingredients (id INTEGER PRIMARY KEY AUTOINCREMENT, recipe_id REFERENCES Recipes(id), quantity INTEGER , unit TEXT)"
        
        if sqlite3_exec(db,createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }
    
    func insertIngredients(name: String, quantity: Int32, unit: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Ingredients (name, quantity, unit) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, name, -1, SQLITETRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 2, quantity ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding quantity: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, unit, -1, SQLITETRANSIENT ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding unit \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("Ingredients saved successfully")
    }
    
    func insertRecipe(name: String, method: String, attachment: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Recipe (name, method, attachment) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, name, -1, SQLITETRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, method, -1, SQLITETRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding quantity: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, attachment, -1, SQLITETRANSIENT ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding unit \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("Recipe saved successfully")
    }
    
    
    func checkStock(){
        var stock = [Ingredient]()
        stock.removeAll()
        
        let queryString = "SELECT * FROM Ingredients"
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let quantity = sqlite3_column_int(stmt, 2)
            let unit = sqlite3_column_text(stmt, 3)
            
            //adding values to list
            stock.append(Ingredient(id: Int(id), name: name, quantity: Int(quantity), unit: String(cString: unit!)))
        }
        dump(stock)
    }
    
    
    func updateStock(name: String, quantity: Int32){
        
        let updateStatementString = "UPDATE Ingredients SET Quantity = " + String(quantity) + " WHERE Name = '" + name + "';"
        
        var updateStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not update row.")
            }
        } else {
            print("UPDATE statement could not be prepared")
        }
        sqlite3_finalize(updateStatement)
    }
    
    func deleteItem(name: String) {
        let deleteStatementStirng = "DELETE FROM Ingredients WHERE Name = '" + name + "';"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        
        sqlite3_finalize(deleteStatement)
    }

}

