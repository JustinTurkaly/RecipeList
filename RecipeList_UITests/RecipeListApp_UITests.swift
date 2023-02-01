//
//  RecipeListApp_UITests.swift
//  RecipeList_UITests
//
//  Created by Justin Turkaly on 1/31/23.
//

import XCTest

final class RecipeListApp_UITests: XCTestCase {
    
    //initialize app
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    
    //Tests page navigation
    func test_RecipeListApp_listElement_shouldNavigatePage() {
                
        let title = "Apam balik"
        let button = app.collectionViews.buttons[title]

        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: button, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        button.tap()
        
        let navigationTitle = app.navigationBars[title]
        XCTAssert(navigationTitle.waitForExistence(timeout: 5))
    }
    
    
    //Tests instructions rendered
    func test_RecipeListApp_instructions_shouldExist() {
                
        let title = "Apam balik"
        let instructions = "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm."
        let predicate = NSPredicate(format: "label LIKE %@", instructions)
        
        let button = app.collectionViews.buttons[title]

        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: button, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        button.tap()
        
        let instructionsView = app.scrollViews["instructions"].otherElements.staticTexts.element(matching: predicate)
        XCTAssert(instructionsView.waitForExistence(timeout: 5))
    }
    
    
    //Tests ingredients rendered
    func test_RecipeListApp_ingredients_shouldExist() {
                
        let title = "Apam balik"
        let button = app.collectionViews.buttons[title]

        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: button, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        button.tap()
        
        let ingredientsView = app.collectionViews
        let ing1 = ingredientsView.staticTexts["Milk"]
        let ing2 = ingredientsView.staticTexts["Oil"]
        let ing3 = ingredientsView.staticTexts["Eggs"]
        let measure1 = ingredientsView.staticTexts["200ml"]
        let measure2 = ingredientsView.staticTexts["60ml"]
        let measure3 = ingredientsView.staticTexts["2"]
        
        XCTAssert(ing1.waitForExistence(timeout: 5))
        XCTAssert(ing2.waitForExistence(timeout: 5))
        XCTAssert(ing3.waitForExistence(timeout: 5))
        XCTAssert(measure1.waitForExistence(timeout: 5))
        XCTAssert(measure2.waitForExistence(timeout: 5))
        XCTAssert(measure3.waitForExistence(timeout: 5))
    }
}
