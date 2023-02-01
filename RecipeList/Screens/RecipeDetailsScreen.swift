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
    
    
    let bounds = UIScreen.main.bounds
    
    var body: some View {
        NavigationView {
            VStack {
                let flattenedArray = recipeDetailsVM.ingredientArray.flatMap { $0 }
                IngredientListView(ingredients: flattenedArray)
                //            ForEach(recipeDetailsVM.ingredientArray.flatMap { $0 }, id: \.id) { ingredient in
                //                Text("\(ingredient.name) \(ingredient.measurement)")
                //            }
                ScrollView {
                    Text(recipeDetailsVM.strInstructions)
                    
                }
                
                //        List(recipeDetailsVM.ingredientArray) { ingredien in
                //            Text(ingredien)
                //        }
                    .task {
                        await recipeDetailsVM.populateRecipeDetails(recipeId: recipeId)
                    }
            }
            .accessibilityIdentifier("navigationTitle")
        }
        
    }
}

struct RecipeDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsScreen(recipeId: "52772")
    }
}
