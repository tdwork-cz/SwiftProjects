//
//  CardViewInStack.swift
//  QuoteaApp
//
//  Created by Тимофей Дудич on 10.02.22.
//

import SwiftUI

struct CardViewInStack: View {
    var quote:Quote
    var body: some View {
        ZStack {
            Image(quote.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 10.0) {
                Text(quote.quotes[0])
                    .padding()
                    .font(.title)
                    .shadow(color: Color.black, radius: 10, x: 3, y: 3)
                
                Text("-"+quote.name)
                    .font(.headline)
                
            }.padding([.top, .leading], 20.0)
            .shadow(color: .black, radius: 10, x: 2, y: 2)
            
        }
        .foregroundColor(Color.white)
        .frame(width: .none, height: 450, alignment: .center)
        .clipped()
        .cornerRadius(15)
        .padding([.leading, .trailing])
    }
}

struct CardViewInStack_Previews: PreviewProvider {
    static var previews: some View {
        let quote = QuoteModel().quotes[0]
        CardViewInStack(quote: quote)
    }
}
