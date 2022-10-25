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
    var bookSelectionDelegate: BookSelectionDelegate!
    @IBOutlet var tableView: UITableView!
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
        
        tableView.delegate = self
        tableView.dataSource = self
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

extension BookDetailViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookDetail", for: indexPath) as! BookCell
        
        guard let book = book else { return cell }
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.coverImage.load(URL(book.coverImage), defaultImage: "defaultBookImage")
  
        return cell
    }
    
}
