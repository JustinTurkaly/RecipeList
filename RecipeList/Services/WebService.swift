//
//  Webservice.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/29/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
}

class WebService {
    
    func get<T: Decodable>(url: URL, parse: (Data) -> T?) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw NetworkError.badRequest
        }
//        print("Raw data: \(String(data: data, encoding: .utf8) ?? "")")
        
        guard let result = parse(data) else {
            throw NetworkError.decodingError
        }
//        print(result)
        return result
    }
    
}
