//
//  UIImageView+Extensions.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/19/22.
//

import UIKit

extension UIImageView {
    func load(_ url: URL) {    
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
