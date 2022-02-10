//
//  Recipe.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 8.02.22.
//

import Foundation

class Recipe:Decodable,Identifiable {
    var id:UUID? = UUID()
    
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
}
