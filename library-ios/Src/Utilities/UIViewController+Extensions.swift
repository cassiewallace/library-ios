//
//  UIViewController+Extensions.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/20/22.
//

import UIKit

extension UIViewController {

    // Present an error from the view controller.
    //
    // Parameters:
    // title: Alert title.
    // message: Alert message.
    func presentOkAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ac, animated: true)
    }

}
