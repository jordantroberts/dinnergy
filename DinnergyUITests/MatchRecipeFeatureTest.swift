import Foundation
import XCTest

class MatchRecipeFeatureTest: XCTestCase {
    
    func testMatchBananaRecipe() {
        let app = XCUIApplication()
        addBananas(number: "4")
        app.buttons["Recipes"].tap()
        XCTAssert(app.staticTexts["Vegan Banana Bread"].exists)
        deleteFourBanana()
    }
}
