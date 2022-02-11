//
//  QuoteViewModel.swift
//  QuoteaApp
//
//  Created by Тимофей Дудич on 10.02.22.
//

import Foundation

class QuoteModel:ObservableObject {
    @Published var quotes:[Quote] = [Quote]()
    init() {
        self.quotes = JSONService.parseLocalJson()
    }
}
