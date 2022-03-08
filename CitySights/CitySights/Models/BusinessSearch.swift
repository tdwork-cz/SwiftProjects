//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Тимофей Дудич on 8.03.22.
//

import Foundation

struct BusinessSearch:Decodable {
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region:Decodable {
    var center = Coordinate()
}
