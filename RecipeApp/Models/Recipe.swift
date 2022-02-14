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
    var ingredients:[Ingredient]
    var directions:[String]
    var highlights:[String]
}

class Ingredient:Identifiable,Decodable {
    var id:UUID? = UUID()
    
    var name:String
    var num:Int?
    var den:Int?
    var unit:String?
}
