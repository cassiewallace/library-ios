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
    var cover_image: String
    var id: Int
}
