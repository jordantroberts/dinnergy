//
//  IngredientDeleteFeatureTest.swift
//  DinnergyUITests
//
//  Created by Jordan Roberts on 18/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//


import Foundation
import XCTest

class IngredientDeleteFeatureTest: XCTestCase {
    
    let app = XCUIApplication()

    func testDeleteIngredient(){
        
        addBananas(number: "4")
        deleteFourBanana()

//        XCUIApplication().tables.staticTexts["banana: 4.0 kg"].swipeLeft()
//        XCUIApplication().tables.buttons["Delete"].tap()
        XCTAssertFalse(app.staticTexts["banana: 4.0 kg"].exists)
    }
}

