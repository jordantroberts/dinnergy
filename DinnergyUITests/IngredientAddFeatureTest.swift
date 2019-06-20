import Foundation
import XCTest
@testable import Dinnergy

 class IngredientAddUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testAddIngredientToList() {
        let app = XCUIApplication()
        addBananas(number: "3")
        
        XCTAssert(app.staticTexts["banana: 3.0 kg"].exists)
    }
    
    func testAddIngredientwithNoInput() {
        let app = XCUIApplication()
        app.navigationBars["My Ingredients"].buttons["+"].tap()
        app.buttons["Add"].tap()
        app.alerts["Successfully Added"].buttons["OK"].tap()
        app.buttons["Back"].tap()
        XCTAssert(app.staticTexts[": 0.0 "].exists)
        app.buttons["Ingredients"].tap()
        XCUIApplication().tables.staticTexts[": 0.0 "].swipeLeft()
        XCUIApplication().tables.buttons["Delete"].tap()
    }

    func testAddIngredientMessage() {
        let app = XCUIApplication()
        app.navigationBars["My Ingredients"].buttons["+"].tap()
        
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
        XCTAssert(app.staticTexts["Successfully Added"].exists)
        XCTAssert(app.staticTexts["This item has been added to your ingredients list"].exists)
        app.alerts["Successfully Added"].buttons["OK"].tap()
        app.buttons["Back"].tap()
    }

 }
