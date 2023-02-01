//
//  RecipeListScreen.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/29/23.
//

import SwiftUI

struct RecipeListScreen: View {
    
    @StateObject var model: RecipeListViewModel =
      RecipeListViewModel()
    
    var body: some View {
        NavigationView {
            RecipeListView(recipes: model.recipeList)
                .task {
                    await model.populateList()
                }
        }
        .navigationTitle("Desserts")
    }
}
