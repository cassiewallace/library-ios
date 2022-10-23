//
//  Book.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/17/22.
//

import Foundation

struct Book: Codable {

    // MARK: - Variables
    
    var title: String
    var author: String
    var coverImage: String
    var id: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case id
        case coverImage = "cover_image"
    }
    
}
