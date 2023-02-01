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
    @Published var ingredientArray: [[IngredientViewModel]] = []
    
    func populateRecipeDetails(recipeId: String) async {
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
            self.strMeal = recipeDetails[0].strMeal
            self.strInstructions = recipeDetails[0].strInstructions
            
            var i = 1
            var j = 1
            
            var measurements = [String]()
            var ingredients = [String]()
            var maxLength: Int = 0
            
            let mirror = Mirror(reflecting: recipeDetails[0])
//            print(mirror.children)
                for child in mirror.children {
                    let ing = "strIngredient\(i)"
                    let measure = "strMeasure\(j)"
//                    print("\(ing)--\(child.label)")
                    if let label = child.label, label == ing {
                        if let value = child.value as? String {
                            if (!value.isEmpty) {
                                ingredients.append(value)
                                i+=1
                            }
                            maxLength = ingredients.count
                          }
                    }
                    if let label = child.label, label == measure {
                        if let value = child.value as? String {
                            if (!value.isEmpty) {
                                measurements.append(value)
                                j+=1
                            }
                          }
                    }
                }
//            print(ingredients)
//            print(measurements)
//
            var k = 0
            while (k < maxLength) {
//                print("\(ingredients[k])----\(measurements[k])")
                addIngredient(ingredientName: ingredients[k], ingredientMeasurement: measurements[k])
                k += 1
            }
//            self.ingredientArray = result
            print(ingredientArray)
            
            
            
            func addIngredient(ingredientName: String, ingredientMeasurement: String) {
                   let ingredient = IngredientViewModel(name: ingredientName, measurement: ingredientMeasurement)
                   if var innerArray = ingredientArray.last {
                       innerArray.append(ingredient)
                       ingredientArray[ingredientArray.count - 1] = innerArray
                   } else {
                       ingredientArray.append([ingredient])
                   }
               }
            
        } catch {
            print(error)
        }
        
    }
    
}

struct IngredientViewModel: Identifiable {
    let id = UUID()
    let name: String
    let measurement: String
}
