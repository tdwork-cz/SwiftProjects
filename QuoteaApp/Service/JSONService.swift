//
//  JSONService.swift
//  QuoteaApp
//
//  Created by Тимофей Дудич on 10.02.22.
//

import Foundation

class JSONService {
    static func parseLocalJson() -> [Quote] {
        var dataQuotes:[Quote] = [Quote]()
        let pathJSON = Bundle.main.path(forResource: "data", ofType: "json")
        if let path = pathJSON {
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                
                do {
                    dataQuotes = try decoder.decode([Quote].self, from: data)
                    
                    for index in 0..<dataQuotes.count {
                        dataQuotes[index].id = UUID()
                    }
                }
            }
            catch {
                print("Error occured while parsing local json file")
                return [Quote]()
            }
        }
        return dataQuotes
    }
}
