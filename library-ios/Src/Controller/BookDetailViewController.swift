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
    var bookSelectionDelegate: BookSelectionDelegate!
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
        navigationItem.largeTitleDisplayMode = .never
        
        guard let book = book else { return }
        bookSelectionDelegate.didSelectBook(book)
    }

}

// MARK: - Extensions

extension BookDetailViewController: BookSelectionDelegate {

    func didSelectBook(_ book: Book) {
        title = book.title
        bookTitle.text = book.title
        bookAuthor.text = book.author
        coverThumbnailImage.load(URL(book.coverImage), defaultImage: "defaultBookImage")
    }
    
}
