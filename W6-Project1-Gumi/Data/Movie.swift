//
//  Movie.swift
//  W6-Project1-Gumi
//
//  Created by Thành Nguyên on 20/04/2021.
//

import UIKit

struct Movie : Codable {
    var adult : Bool
    var backdrop_path : String
    var genre_ids : [Int]
    var id : Int
    var original_language : String
    var original_title : String
    var overview : String
    var popularity : Double
    var poster_path : String
    var release_date : String
    var title : String
    var video : Bool
    var vote_average : Float
    var vote_count : Int
    
    
//    var thumbnailURL: String?
//    var name: String?
//    var description: String?
//    var genre: String?
//
//    init(thumbnailURL: String?, name: String?, description: String?, genre: String?) {
//        self.thumbnailURL = (thumbnailURL != nil) ? thumbnailURL : ""
//        self.name = (name != nil) ? name : "Unknown"
//        self.description = (description != nil) ? description : "Unknown"
//        self.genre = (genre != nil) ? genre : "Undefined"
//    }
}
