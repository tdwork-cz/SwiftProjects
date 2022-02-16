//
//  ContentView.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 8.02.22.
//

import SwiftUI

struct RecipeListView: View {
    //In this propetry our Environment Variable would be stored
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipies")
                    .bold()
                    .padding(.top, 30)
                    .font(.largeTitle)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipies) {r in
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
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }.navigationBarHidden(true)
        }.padding(.leading)
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
