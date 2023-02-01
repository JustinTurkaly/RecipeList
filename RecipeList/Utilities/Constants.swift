//
//  Constants.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/29/23.
//

import Foundation

struct Constants {
    
    struct Urls {
        static let recipeListUrl = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        
        static func detailsById(_ id: String) -> URL {
            return URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        }
    }
}
