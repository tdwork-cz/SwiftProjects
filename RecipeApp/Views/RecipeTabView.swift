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
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
