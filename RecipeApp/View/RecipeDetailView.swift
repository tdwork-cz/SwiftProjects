//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 8.02.22.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var selectedServingSize = 2
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //The image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                //The title
                Text(recipe.name)
                    .bold()
                    .font(.largeTitle)
                    .padding([.leading, .bottom])
                //Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size")
                    Picker("ServingSize", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                }
                .padding(.leading)
                //Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .bold()
                        .font(.title)
                //We don't need an ID anymore, cause ingrediens now is an Identifiable
                    ForEach (recipe.ingredients) { r in
                        Text("•"+RecipeModel.getPortionSize(ingredient: r, recipeServingSize: recipe.servings, targetServings: selectedServingSize)+" "+r.name.lowercased())
                    }
                }
                .padding()
                //Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .bold()
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(0..<recipe.directions.count, id:\.self) {index in
                        Text("\(index+1))\(recipe.directions[index])")
                        Divider()
                    }
                }.padding()
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipies[1])
    }
}
