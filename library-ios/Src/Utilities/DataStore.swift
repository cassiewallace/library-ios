//
//  WebServices.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/17/22.
//

import Foundation

class DataStore {

    // MARK: - Class Methods
    
    static func getBooks(completionHandler: @escaping ([Book]?) -> Void) {
        HTTPClient.get(url: "\(Constants.API.baseURL)/books/?format=json") { (books) in
            completionHandler(books)
            return
        }
    }
    
}
