//
//  RecipeDetailScreen.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/30/23.
//

import SwiftUI

struct RecipeDetailsScreen: View {
    
    let recipeId: String
    @StateObject private var recipeDetailsVM = RecipeDetailsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                let flattenedArray = recipeDetailsVM.ingredientArray.flatMap { $0 }
                IngredientListView(ingredients: flattenedArray)
                ScrollView {
                    Text(recipeDetailsVM.formatInstructions(instructions: recipeDetailsVM.strInstructions))
                        .padding([.leading, .trailing], 20)
                }
                    .task {
                        await recipeDetailsVM.populateRecipeDetails(recipeId: recipeId)
                    }
                    .accessibilityIdentifier("instructions")
            }
            .navigationTitle(recipeDetailsVM.strMeal)
        }
    }
}

