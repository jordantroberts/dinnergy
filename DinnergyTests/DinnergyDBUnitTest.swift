////
///  DinnergyDBUnitTest.swift/
///  DinnergyTests/
////
///  Created by Simon 易 on 20/06/2019./
///  Copyright © 2019 Edgy Eats. All rights reserved./
////

import XCTest
@testable import Dinnergy

class DinnergyDBUnitTest: XCTestCase {
    
    func testInsertIngredients() {
        
        instanceDB.insertIngredients(name: "Banana", quantity: 300.0, unit: "g")
        
        let ingredient = instanceDB.checkStock().last
        XCTAssertEqual(ingredient!.name, "Banana")
        
        instanceDB.deleteItem(name: "Banana")
    }
    
    func testDropTable() {
        
        instanceDB.insertIngredients(name: "Banana", quantity: 300.0, unit: "g")
        instanceDB.dropTable()
        instanceDB.createTable()
        instanceDB.insertIngredients(name: "Egg", quantity: 5 , unit: "")
        let ingredient = instanceDB.checkStock().first
        XCTAssertEqual(ingredient!.name, "Egg")
        instanceDB.deleteItem(name: "Egg")
    }
    
    func testMatchRecipeNameWithID() {
        let recipeID = instanceDB.matchRecipeNameWithID(name: "Vegan Banana Bread")
        XCTAssertEqual(recipeID, 3)
    }
    
    func testListfunctions() {
        instanceDB.dropListTable()
        instanceDB.createListsTable()
        instanceDB.insertList(recipeID: 3)
        XCTAssertEqual(instanceDB.showList().count, 7)
        instanceDB.deleteListItem(name: "Dried fruit/nuts")
        XCTAssertEqual(instanceDB.showList().last?.name, "Cinnamon")
        instanceDB.dropListTable()
        instanceDB.createListsTable()
    }
    
    
}
