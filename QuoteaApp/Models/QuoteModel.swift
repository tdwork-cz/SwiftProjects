//
//  QuoteModel.swift
//  QuoteaApp
//
//  Created by Тимофей Дудич on 10.02.22.
//

import Foundation

class Quote:Decodable,Identifiable {
    var id:UUID? = UUID()
    
    var name:String
    var quotes:[String]
    var image:String
}
