//
//  MapViewFeatureTest.swift
//  DinnergyUITests
//
//  Created by Simon 易 on 18/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

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
