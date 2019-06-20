import Foundation
import XCTest

class IngredientDeleteFeatureTest: XCTestCase {
    
    let app = XCUIApplication()

    func testDeleteIngredient() {
        
        addBananas(number: "4")
        deleteFourBanana()

        XCTAssertFalse(app.staticTexts["banana: 4.0 kg"].exists)
    }
}
