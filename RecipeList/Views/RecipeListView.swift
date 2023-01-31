//
//  RecipeListView.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/29/23.
//

import SwiftUI

struct RecipeListView: View {
    
    let recipes: [RecipeViewModel]
    
    var body: some View {
        List(recipes, id: \.id) { recipe in
            NavigationLink(destination: RecipeDetailsScreen(recipeId: recipe.idMeal).navigationTitle(recipe.title)) {
                RecipeCellView(recipeCell: recipe)
            }
        }
    }
}
