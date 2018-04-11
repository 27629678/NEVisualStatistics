//
//  demoUITests.swift
//  demoUITests
//
//  Created by hzyuxiaohua on 11/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import XCTest

class demoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        let demoNavigationBar = app.navigationBars["demo"]
        demoNavigationBar.buttons["add"].tap()
        demoNavigationBar.buttons["more"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["998"]/*[[".buttons[\"btn\"]",".buttons[\"998\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Item"].tap()
        
        let emptyListTable = app.tables["Empty list"]
        emptyListTable.swipeDown()
        emptyListTable.swipeUp()
        emptyListTable.swipeUp()
        tabBarsQuery.buttons["demo"].tap()
        
        
    }
    
}
