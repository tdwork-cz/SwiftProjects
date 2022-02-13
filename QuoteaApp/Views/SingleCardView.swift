//
//  SingleCardView.swift
//  QuoteaApp
//
//  Created by Тимофей Дудич on 10.02.22.
//

import SwiftUI

struct SingleCardView: View {
    var quote:Quote
    var body: some View {
        VStack(alignment: .leading, spacing: 15.0) {
            ForEach(quote.quotes, id:\.self) {q in
                Text("-\(q)")
                    .font(.headline)
            }
            Spacer()
        }.navigationTitle(quote.name)
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        let temp = QuoteModel().quotes[0]
        SingleCardView(quote: temp)
    }
}
