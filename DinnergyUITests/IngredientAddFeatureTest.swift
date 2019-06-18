
 //  DinnergyUITest
 //
 //  Created by Oliver Cripps on 17/06/2019.
 //  Copyright © 2019 Edgy Eats. All rights reserved.
 //
 import Foundation
 import XCTest
 class IngredientAddUITests: XCTestCase {
    
    func testAddIngredientToList() {
        let app = XCUIApplication()
        app.navigationBars["My Ingredients"].buttons["New"].tap()
        app.textFields["Enter ingredient name"].tap()
        
        let bKey = app.keys["b"]
        let aKey = app.keys["a"]
        let nKey = app.keys["n"]
        
        bKey.tap()
        aKey.tap()
        nKey.tap()
        aKey.tap()
        nKey.tap()
        aKey.tap()
        app.textFields["Quantity"].tap()
        
        let moreKey = app.keys["more"]
        moreKey.tap()
        let key = app.keys["3"]
        key.tap()
        
        app.textFields["Units"].tap()
        let kKey = app.keys["k"]
        let gKey = app.keys["g"]
        kKey.tap()
        gKey.tap()
        app.buttons["Add"].tap()
        
        XCTAssert(app.staticTexts["banana: 3.0 kg"].exists)
    }
    
 }
