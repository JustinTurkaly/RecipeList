//
//  RecipeListScreen.swift
//  RecipeList
//
//  Created by Justin Turkaly on 1/29/23.
//

import SwiftUI

struct RecipeListScreen: View {
    
    @StateObject var model: RecipeListViewModel =
      RecipeListViewModel()
    
    var body: some View {
        NavigationView {
            
        }
    }
}

struct RecipeListScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListScreen()
    }
}
