import XCTest
import MapKit

class MapViewFeatureTest: XCTestCase {

    func testMatchMap() {
        let app = XCUIApplication()
        app.tabBars.buttons["Nearby"].tap()
        XCTAssert(app.segmentedControls.buttons["Food Bank"].exists)
        app.buttons["Food Bank"].tap()
        app.buttons["Ingredients"].tap()
    }
    
    func testMapSupermarkets() {
        let app = XCUIApplication()
        app.tabBars.buttons["Nearby"].tap()
        XCTAssert(app.segmentedControls.buttons["Supermarket"].exists)
        app.buttons["Supermarket"].tap()
        app.buttons["Ingredients"].tap()
    }
}
