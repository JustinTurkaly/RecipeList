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
        VStack(alignment: .leading) {
            Text(recipeDetailsVM.strMeal)
                 Spacer()
            Text(recipeDetailsVM.strInstructions)
             }
        .padding()
        .task {
            await recipeDetailsVM.populateRecipeDetails(recipeId: recipeId)
        }
    }
}

struct RecipeDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsScreen(recipeId: "52772")
    }
}
