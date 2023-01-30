//
//  RecipeListApp.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/28/23.
//

import SwiftUI

@main
struct RecipeListApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeDetailsScreen(recipeId: "52772")
        }
    }
}
