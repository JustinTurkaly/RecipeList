//
//  IngredientListView.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/30/23.
//

import SwiftUI

struct IngredientListView: View {
    
    let ingredients: [IngredientViewModel]
    
    var body: some View {
        List(ingredients) { ingredient in
            IngredientCellView(ingredientCell: ingredient)
        }
    }
}

