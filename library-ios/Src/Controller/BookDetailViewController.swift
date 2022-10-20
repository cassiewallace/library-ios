//
//  BookDetailViewController.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/17/22.
//

import UIKit

class BookDetailViewController: UIViewController {

    // MARK: - Variables
    
    var book: Book?
    @IBOutlet var bookTitle: UILabel!
    @IBOutlet var bookAuthor: UILabel!
    @IBOutlet var coverThumbnailImage: UIImageView!
    
    // MARK: - UIViewController Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private Functions
    
    private func setupView() {
        guard let book = book else { return }
        
        title = book.title
        navigationItem.largeTitleDisplayMode = .never
        
        bookTitle.text = book.title
        bookAuthor.text = book.author
        coverThumbnailImage.load(URL(book.cover_image))
    }

}
