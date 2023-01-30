//
//  RecipeDetailsViewModel.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/30/23.
//

import Foundation

@MainActor
class RecipeDetailsViewModel: ObservableObject {
    
    @Published var strMeal: String = ""
    @Published var strInstructions: String = ""
    @Published var strTags: String = ""
    
    func populateRecipeDetails(recipeId: String) async {
        print(recipeId)
        do {
            let recipeDetailsResponse = try await WebService().get(url:
                Constants.Urls.detailsById(recipeId)) { data in
                do {
//                    print(RecipeListResponse.self)
                    return try JSONDecoder().decode(RecipeDetailsResponse.self, from: data)
                } catch {
                    print("JSON decoding error: \(error)")
                    return nil
                }
            }
            let recipeDetails = recipeDetailsResponse.meals
//            print(recipeDetails)
            self.strMeal = recipeDetails[0].strMeal
            self.strInstructions = recipeDetails[0].strInstructions
            self.strTags = recipeDetails[0].strTags
            
        } catch {
            print(error)
        }
        
    }
    
}
