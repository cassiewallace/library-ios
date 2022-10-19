//
//  String+Extensions.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/19/22.
//

import Foundation

extension URL {
    init(_ string: String) {
        self.init(string: "\(string)")!
    }
}
