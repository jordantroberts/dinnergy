
 //  DinnergyUITest
 //
 //  Created by Oliver Cripps on 17/06/2019.
 //  Copyright © 2019 Edgy Eats. All rights reserved.
 //
 import Foundation
 import XCTest
 class IngredientAddUITests: XCTestCase {
    
    func testAddIngredientToList() {
        let app = XCUIApplication()
        addBananas(number: "3")
        
        XCTAssert(app.staticTexts["banana: 3.0 kg"].exists)
    }
    
 }
