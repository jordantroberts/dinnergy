//
//  MatchRecipeFeatureTest.swift
//  DinnergyUITests
//
//  Created by Simon 易 on 18/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import Foundation
import XCTest

class MatchRecipeFeatureTest: XCTestCase {
    
    func testMatchBananaRecipe() {
        let app = XCUIApplication()
        addBananas(number: "4")
        app.buttons["Recipe"].tap()
        XCTAssert(app.staticTexts["Vegan Banana Bread"].exists)
    }

}
