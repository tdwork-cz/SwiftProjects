//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 8.02.22.
//

import Foundation

class RecipeModel:ObservableObject {
    @Published var recipies = [Recipe]()
    
    init() {
        self.recipies = DataService.getLocalData()
    }
}
