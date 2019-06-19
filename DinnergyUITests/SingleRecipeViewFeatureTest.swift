//
//  SingleRecipeViewFeatureTest.swift
//  DinnergyUITests
//
//  Created by Simon 易 on 18/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import Foundation
import XCTest

class SingleRecipeViewFeatureTest: XCTestCase {
        override func setUp() {
            super.setUp()
            
            continueAfterFailure = false
            XCUIApplication().launch()
        }

        func testMatchBananaRecipe() {
            let app = XCUIApplication()
            addBananas(number: "4")
            app.buttons["Recipes"].tap()
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
            XCTAssert(app.staticTexts["Ingredients"].exists)
            deleteFourBanana()
            
        }
        
    }



