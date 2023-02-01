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
    let strIngredient1: String
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strMeasure1: String
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
}


    
//    let allKeys: [String: Any?]
//
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: AnyCodingKey.self)
//            var temp = [String: Any?]()
//            try container.allKeys.forEach({ (key) in
//                if let stringValue = try? container.decode(String.self, forKey: key) {
//                    temp[key.stringValue] = stringValue
//                } else {
//                    temp[key.stringValue] = nil
//                }
//            })
//            allKeys = temp
//        }
//    }
//
//    struct AnyCodingKey: CodingKey {
//        var stringValue: String
//        init?(stringValue: String) {
//            self.stringValue = stringValue
//        }
//
//        var intValue: Int?
//        init?(intValue: Int) {
//            self.intValue = intValue
//            self.stringValue = "\(intValue)"
//        }
//    }

//extension RecipeDetail {
//    static func test() {
//        print("test")
//    }
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

