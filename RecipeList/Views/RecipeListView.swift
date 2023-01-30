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
        List(recipes) { recipe in
            RecipeCellView(recipeCell: recipe)
        }
    }
}

