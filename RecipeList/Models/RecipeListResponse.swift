//
//  RecipeListResponse.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/29/23.
//

import Foundation

struct RecipeListResponse: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let strMeal: String
    let strMealThumb: String
}
