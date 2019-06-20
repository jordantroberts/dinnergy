import Foundation
 import XCTest
 class IngredientAddUITests: XCTestCase {
    
    func testAddIngredientToList() {
        let app = XCUIApplication()
        addBananas(number: "3")
        
        XCTAssert(app.staticTexts["banana: 3.0 kg"].exists)
        
        
    }
    
 }
