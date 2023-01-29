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
            let recipeListResponse = try await Webservice().get(url: Constants.Urls.recipeListUrl) {
                data in
                return try? JSONDecoder().decode(RecipeListResponse.self, from: data)
            }
            
            self.recipeList = recipeListResponse.meals.map(RecipeViewModel.init)
            
        } catch {
            print(error)
        }
    }
    
    struct RecipeViewModel: Identifiable {
        
        let id = UUID()
        private let meal: Meal
        
        init(_ meal: Meal) {
            self.meal = meal
        }
        
        var title: String {
            meal.strMeal
        }
        
        var imageUrl: URL? {
            URL(string: meal.strMealThumb)
        }
    }
}
