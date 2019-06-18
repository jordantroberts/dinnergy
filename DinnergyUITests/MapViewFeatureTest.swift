//
//  MapViewFeatureTest.swift
//  DinnergyUITests
//
//  Created by Simon 易 on 18/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import Foundation
import XCTest

class MapViewFeatureTest: XCTestCase {

    func testMatchMap() {
        let app = XCUIApplication()
        app.tabBars.buttons["Foodbank"].tap()
        XCTAssert(app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Food Bank"]/*[[".segmentedControls.buttons[\"Food Bank\"]",".buttons[\"Food Bank\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.exists)
        app.buttons["Ingredient"].tap()
    }
    
    func test2MatchMap() {
        let app = XCUIApplication()
        app.tabBars.buttons["Ingredient"].tap()
        app.tabBars.buttons["Foodbank"].tap()
        XCTAssert(app.segmentedControls.buttons["Supermarket"].exists)
        app.buttons["Ingredient"].tap()
    }

}
