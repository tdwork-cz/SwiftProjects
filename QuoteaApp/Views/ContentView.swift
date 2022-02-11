//
//  ContentView.swift
//  QuoteaApp
//
//  Created by Тимофей Дудич on 10.02.22.
//

import SwiftUI

struct ContentView: View {
    var quote = QuoteModel()
    
    var body: some View {
        NavigationView {
            List(quote.quotes) { q in
                NavigationLink {
                    EmptyView()
                    SingleCardView(quote: q)
                    
                } label: {
                    CardViewInStack(quote: q)
                }.navigationTitle("Everyday Quotes")

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
