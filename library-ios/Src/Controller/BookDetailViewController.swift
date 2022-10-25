//
//  BookDetailViewController.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/17/22.
//

import UIKit

class BookDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Variables
    
    var book: Book?
    var bookAuthor: String?
    var bookTitle: String?
    var bookCoverImage: String?
    var bookSelectionDelegate: BookSelectionDelegate!
    @IBOutlet var tableView: UITableView!
    
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
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - Extensions
extension BookDetailViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookDetail", for: indexPath) as! BookCell
        cell.titleLabel.text = bookTitle
        cell.authorLabel.text = bookAuthor
        cell.coverImage.load(URL(bookCoverImage ?? ""), defaultImage: "defaultBookImage")
  
        return cell
    }
    
}

extension BookDetailViewController: BookSelectionDelegate {

    func didSelectBook(_ book: Book) {
        title = book.title
        bookTitle = book.title
        bookAuthor = book.author
        bookCoverImage = book.coverImage
    }
    
}
