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
    
    static func getPortionSize(ingredient:Ingredient, recipeServingSize:Int, targetServings:Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.den ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            denominator *= recipeServingSize
            numerator *= targetServings
            let divisior = Utilities.greatestCommonDivisor(denominator, numerator)
            numerator /= divisior
            denominator /= divisior
            
            if numerator >= denominator {
                wholePortions = numerator/denominator
                numerator %= denominator
                
                portion += String(wholePortions)
            }
            if numerator > 0  {
                //Inline if-statement
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = ingredient.unit {
            if wholePortions > 1 { //Working with suffixes in plural form
                //If the last to characters is equal to somtehing
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "v" {
                //Return all the characters, leave out the last one
                //Method returns Array, we need to cast it
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            //If there's a space between PortionNumber and PotrionUnit
            //If there's no PortionNumber, there shouldn't be a space
            portion += ingredient.num == nil && ingredient.den == nil ? "" : " "
            return String(portion + unit)
        }
        return String(portion)
    }
}
