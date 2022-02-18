//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 14.02.22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 10)
                .font(.largeTitle)
            
            GeometryReader { geo in
                
            TabView(selection: $tabSelectionIndex) {
                ForEach(0..<model.recipies.count) {index in
                    if model.recipies[index].featured {
                        Button {
                            self.isDetailViewShowing = true
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.white)
                                VStack(spacing: 0) {
                                    Image(model.recipies[index].image)
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                    
                                    Text(model.recipies[index].name)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width - 50, height: geo.size.height - 110)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6),
                                    radius: 10, x: -5, y: 5)
                            
                        }.buttonStyle(PlainButtonStyle())
                        .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipies[index])
                        }
                        .tag(index)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                let currentRecipe = model.recipies[tabSelectionIndex]
                Text("Preparation time:")
                    .font(.headline)
                
                Text(currentRecipe.prepTime)
                
//                Text("Highlights")
//                ForEach(currentRecipe.highlights) {hg in
//                    Text(hg)
//                }
            }
            .padding(.leading)
            .padding(.bottom)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
