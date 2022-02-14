//
//  RecipeTabView.swift
//  RecipeApp
//
//  Created by Тимофей Дудич on 13.02.22.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabIndex = 1
    
    var body: some View {
        TabView(selection: $tabIndex) {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Text("Featured")
                        Image(systemName: "star")
                    }
                }
            .tag(0)
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            .tag(1)
        }
        //In RecipeModel the data from the JSON is parsing
        
        //This Variable can be used everywhere in the app
        //We need to add this object at the top of the App node, ex. Home Screen
        //because higher layers of the App wouldn't have access to the envObj which is in the lower layer
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
