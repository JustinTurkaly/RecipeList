//
//  RecipeDetailsResponse.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/30/23.
//

import Foundation

struct RecipeDetailsResponse: Decodable {
    let meals: [RecipeDetail]
}

struct RecipeDetail: Decodable {
       let strMeal: String
       let strInstructions: String
       let idMeal: String
       let strTags: String
}

extension RecipeDetail {
    static func test() {
        print("test")
    }
//  static func map(from jsonString: String) -> RecipeDetail? {
//          guard let dict = jsonString.toDictionary() else { return nil }
//          let name = dict["strMeal"] as? String
//          let instructs = dict["strMeal"] as? String
//          let idMeal = dict["idMeal"] as? String
//          let strTags = dict["strTags"] as? String
//          return RecipeDetail(strMeal: name ?? "",
//                              strInstructions: instructs ?? "",
//                              idMeal: idMeal ?? "",
//                              strTags: strTags ?? ""
//                             )
//  }
}
