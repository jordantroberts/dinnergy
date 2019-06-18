//
//  IngredientDeleteFeatureTest.swift
//  DinnergyUITests
//
//  Created by Jordan Roberts on 18/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import XCTest
import Foundation

class IngredientDeleteFeatureTest: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testDeleteIngredient(){
        // helper function add banana to list (Simon's test)
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
        let key = app.keys["4"]
        key.tap()
        
        app.textFields["Units"].tap()
        let kKey = app.keys["k"]
        let gKey = app.keys["g"]
        kKey.tap()
        gKey.tap()
        app.buttons["Add"].tap()

        XCUIApplication().tables.staticTexts["banana: 4.0 kg"].swipeLeft()
        XCUIApplication().tables.buttons["Delete"].tap()
        XCTAssertFalse(app.staticTexts["banana: 4.0 kg"].exists)
    }
}

