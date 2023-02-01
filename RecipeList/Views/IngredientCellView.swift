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
        HStack {
            Text(ingredientCell.name)
            Text("-")
            Text(ingredientCell.measurement)
      }
    }
}
