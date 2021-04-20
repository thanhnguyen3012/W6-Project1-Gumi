//
//  File.swift
//  W6-Project1-Gumi
//
//  Created by Thành Nguyên on 20/04/2021.
//

import UIKit

struct MoviePage: Codable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
}
