//
//  String+Extensions.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/19/22.
//

import Foundation

extension URL {

    // Create a URL from a force-unwrapped string,
    // avoiding unwrapping everywhere.
    //
    // Parameters:
    // string: String to convert to URL.
    init(_ string: String) {
        self.init(string: "\(string)")!
    }
}
