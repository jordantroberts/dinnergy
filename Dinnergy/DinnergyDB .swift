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
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("dinnergy.sqlite")
        
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
            return
        }else{
            print("SUCESS opening database")
        }
        
        createTable()
//        insertIngredients(name: "Egg", quntity: 2 , unit: "unit")
    }
    
    func createTable(){
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Ingredients (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quntity INTEGER ,unit TEXT)"

        if sqlite3_exec(db,createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")

        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }
    
    func insertIngredients(name: String, quntity: Int32, unit: String) {
        
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Ingredients (name, quntity, unit) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, name, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 2, quntity ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding quntity: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, unit, -1, SQLITE_TRANSIENT ) != SQLITE_OK{
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
    

    
}



