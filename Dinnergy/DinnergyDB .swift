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
}



