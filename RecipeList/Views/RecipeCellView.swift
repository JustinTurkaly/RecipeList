//
//  RecipeCellView.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/29/23.
//

import SwiftUI

struct RecipeCellView: View {
    
    let recipeCell: RecipeViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: recipeCell.imageUrl) { image in
                            image.resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        } placeholder: {
                            ProgressView()
                        }
            
            Text(recipeCell.title)
        }
    }
}
