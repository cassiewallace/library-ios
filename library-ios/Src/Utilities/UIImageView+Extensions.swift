//
//  UIImageView+Extensions.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/19/22.
//

import UIKit

extension UIImageView {

    // Set a UIImageView's image to the contents of a URL.
    //
    // Parameters:
    // url: URL location of the image.
    func load(_ url: URL, defaultImage: String) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } else {
                let image = UIImage(named: defaultImage)
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
        }
    }
    
}
