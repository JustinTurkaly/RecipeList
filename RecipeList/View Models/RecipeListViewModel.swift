//
//  RecipeListViewModel.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/29/23.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var recipeList: [RecipeViewModel] = []
    
    func populateList() async {
        
        do {
            let recipeListResponse = try await WebService().get(url: Constants.Urls.recipeListUrl) { data in
                do {
//                    print(RecipeListResponse.self)
                    return try JSONDecoder().decode(RecipeListResponse.self, from: data)
                } catch {
                    print("JSON decoding error: \(error)")
                    return nil
                }
            }
            self.recipeList = recipeListResponse.meals.map(RecipeViewModel.init)
        } catch {
            print("Web service error: \(error)")
        }
        print(recipeList)
    }
        
        
        
}
struct RecipeViewModel: Identifiable {
    
    let id = UUID()
    private let recipe: Recipe
    
    init(_ recipe: Recipe) {
        self.recipe = recipe
    }
    
    var title: String {
        recipe.strMeal
    }
    
    var imageUrl: URL? {
        URL(string: recipe.strMealThumb)
    }
}
