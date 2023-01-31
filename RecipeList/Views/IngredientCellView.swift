//
//  IngredientCellView.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/30/23.
//

import SwiftUI

struct IngredientCellView: View {
    
    let ingredientCell: IngredientViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            Text(ingredientCell.name)
                .onTapGesture {
//                    print("Tapped item with id: \(recipeCell.idMeal)")
                }
            Text(ingredientCell.measurement)
      }
    }
}
