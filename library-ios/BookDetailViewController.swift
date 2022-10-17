//
//  BookDetailViewController.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/17/22.
//

import UIKit

class BookDetailViewController: UIViewController {
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let book = book else { return }
        
        title = book.title
    }

}
