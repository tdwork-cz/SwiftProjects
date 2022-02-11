//
//  ContentView.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 8.02.22.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipies) {r in
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack(spacing: 25) {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70, alignment: .center)
                            .clipped()
                            .cornerRadius(10)
                        Text(r.name)
                    }
                }
            }.navigationTitle("All Recepies")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
