import XCTest
import XCTest

class MapViewFeatureTest: XCTestCase {

    func testMatchMap() {
        let app = XCUIApplication()
        app.tabBars.buttons["Nearby"].tap()
        XCTAssert(app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Food Bank"]/*[[".segmentedControls.buttons[\"Food Bank\"]",".buttons[\"Food Bank\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.exists)
        app.buttons["Ingredients"].tap()
    }
}
