//
//  Business.swift
//  CitySights
//
//  Created by Тимофей Дудич on 8.03.22.
//

import Foundation

struct Business:Decodable, Identifiable {
    var id:String?
    
    var alias:String?
    var name:String?
    var image_url:String?
    var url:String?
    var is_closed:Bool?
    var review_count:Int?
    var categories:[Category]?
    var rating:Double?
    var coordinates:Coordinate?
    var transactions:[String]?
    var price:String?
    var location:Location
    var phone:String?
    var display_phone:String?
    var distance:Double? //Watch out this
    
}

struct Location:Decodable {
    var address1:String?
    var address2:String?
    var address3:String?
    var city:String?
    var zip_code:String?
    var country:String?
    var state:String?
    var display_address:[String]?
}

struct Category:Decodable {
    var alias:String?
    var title:String?
}

struct Coordinate:Decodable {
    var longtitude:Double?
    var latitude:Double?
}

