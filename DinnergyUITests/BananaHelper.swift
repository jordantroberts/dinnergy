import Foundation
import XCTest

func addBananas(number: String) {
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
    let key = app.keys[number]
    key.tap()
    
    app.textFields["Units"].tap()
    let kKey = app.keys["k"]
    let gKey = app.keys["g"]
    kKey.tap()
    gKey.tap()
    app.buttons["Add"].tap()
    app.alerts["Successfully Added"].buttons["OK"].tap()
    app.buttons["Back"].tap()
}

func deleteFourBanana() {
    let app = XCUIApplication()
    app.buttons["Ingredients"].tap()
    XCUIApplication().tables.staticTexts["banana: 4.0 kg"].swipeLeft()
    XCUIApplication().tables.buttons["Delete"].tap()
}
