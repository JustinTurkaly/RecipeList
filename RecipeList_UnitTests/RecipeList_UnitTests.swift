//
//  RecipeList_UnitTests.swift
//  RecipeList_UnitTests
//
//  Created by Justin Turkaly on 2/1/23.
//

import XCTest

@MainActor
final class RecipeList_UnitTests: XCTestCase {
    
    //Tests that the RecipeList is populated
    func test_RecipeListViewModel_RecipeList_populateList() async {
        
        let vm: RecipeListViewModel = RecipeListViewModel()
        await vm.populateList()
        
        XCTAssertTrue(vm.recipeList.count > 1)
    }
    
    
    //Tests that RecipeList is sorted Alphabetically
    func test_RecipeListViewModel_RecipeList_sortedAlphabetical() async {
        
        let vm: RecipeListViewModel = RecipeListViewModel()
        await vm.populateList()
        
        let sortedList = vm.recipeList.sorted {
            $0.title < $1.title
        }
        
        for (index, recipe) in vm.recipeList.enumerated() {
                    XCTAssertEqual(recipe.title, sortedList[index].title)
                }
    }
    
    
    //Tests that there are no nil or empty ingredients
    func test_RecipeDetailsViewModel_RecipeDetails_noNilIngredients() async {
        
        let vm = RecipeDetailsViewModel()
        await vm.populateRecipeDetails(recipeId: "53049")
        
        let ingredients = vm.ingredientArray
        
        for (ingredient) in ingredients {
            XCTAssertFalse(ingredient.isEmpty, "Ingredient should not be nil or empty")
                }
    }
}
