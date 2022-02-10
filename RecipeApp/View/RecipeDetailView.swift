//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 8.02.22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //The image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                //Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients\n")
                        .font(.title)
                    
                    ForEach (recipe.ingredients, id: \.self) { r in
                        Text("-"+r)
                    }
                }
                .padding()
                //Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(0..<recipe.directions.count, id:\.self) {index in
                        Text("\(index+1))\(recipe.directions[index])")
                        Divider() //Basically adding empty line
                    }
                }.padding()
            }
        }.navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
//Assigning the 1st recipe to the "recipe" value on the top
//This is done for the preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipies[0])
    }
}
