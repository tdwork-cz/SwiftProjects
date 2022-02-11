//
//  ServiceClass.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 8.02.22.
//

import Foundation

//Through this class the data is fetched
//To avoid duplicating code in several ViewModels
class DataService {
    
    static func getLocalData() -> [Recipe] {
        var recipeData:[Recipe] = [Recipe]()
        let pathJSON = Bundle.main.path(forResource: "data", ofType: "json")
        
        guard pathJSON != nil else{
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathJSON!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {
                recipeData = try decoder.decode([Recipe].self, from: data)
                
                for index in 0..<recipeData.count {
                    recipeData[index].id = UUID()
                    }
                }
            }
        catch {
            print("Exception while parsing local JSON file")
            return [Recipe]()
        }
        
        return recipeData
    }
}

    

