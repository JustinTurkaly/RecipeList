//
//  RecipeListApp_UITests.swift
//  RecipeList_UITests
//
//  Created by Justin Turkaly on 1/31/23.
//

import XCTest

@MainActor
final class RecipeListApp_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_RecipeListApp_listElement_shouldNavigatePage() {
        //Given
        
//        let title: String = "Apam balik"
//        let homeScreen = app.collectionViews
        
        //When
        
//        homeScreen.buttons["Apam balik"].tap()
        
        let button = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Apam balik"]/*[[".cells.buttons[\"Apam balik\"]",".buttons[\"Apam balik\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let exists = NSPredicate(format: "exists == true")

        expectation(for: exists, evaluatedWith: button, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

        button.tap()

//        let navBar = app.navigationBars["Desserts"]
//        let navigationTitle = app.navigationBars["Desserts"]
//        let navigationTitle = app.navigationBars.element(boundBy: 0).title
//        XCTAssertEqual(navigationTitle, "Apam balik")
        //Then
        let navigationTitle = app.navigationBars.firstMatch.staticTexts["navigationTitle"]
        let exists2 = NSPredicate(format: "exists == true")

        // Wait for the navigation title to exist
        expectation(for: exists2, evaluatedWith: navigationTitle, handler: nil)
//        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertTrue(navigationTitle.exists)
        
        
        

//        XCTAssertTrue(navTitle.exists)

        
//        let app = XCUIApplication()
//        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Bakewell tart"]/*[[".cells.buttons[\"Bakewell tart\"]",".buttons[\"Bakewell tart\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars.containing(.button, identifier:"Back").staticTexts["Bakewell tart"].tap()

        
        
//        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Apam balik"]/*[[".cells.buttons[\"Apam balik\"]",".buttons[\"Apam balik\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Apam balik"].staticTexts["Apam balik"].tap()
        
    }
    
    
    
    func test_RecipeListApp_listElement_shouldNavigatePage1() {
        
//        let recipeCellImage = app.images["recipeCellImage-53049"]
//        let firstCell = app.tables.cells.element.firstMatch



//        app.swipeUp()
        
       

//
//        recipeCellImage.tap()
//
        
        let image = app.images["recipeCellImage-53049"]
        let exists = NSPredicate(format: "exists == true")

        expectation(for: exists, evaluatedWith: image, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssert(image.exists)

        image.press(forDuration: 3)
                XCTAssert(app.navigationBars.firstMatch.staticTexts["navigationTitle"].waitForExistence(timeout: 5))
//
//        XCTAssert(app.navigationBars.firstMatch.staticTexts["navigationTitle"].waitForExistence(timeout: 5))
        
    }
}
