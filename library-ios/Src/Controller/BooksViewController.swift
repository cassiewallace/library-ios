//
//  ViewController.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/17/22.
//

import UIKit

class BooksViewController: UITableViewController {
    
    // MARK: - Variables
    
    var books = [Book]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UIViewController Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getBooks()
    }
    
    // MARK: - Private Functions
    
    private func setupView() {
        title = "Library"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Internal Functions

    private func getBooks() {
        DataStore.getBooks() { books in
            guard let books = books else {
                self.presentOkAlert(title: "Loading error", message: "There was a problem loading books.")
                return
            }
            self.books = books
        }
    }
    
}

// MARK: - Extensions

extension BooksViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Book", for: indexPath) as! BookCell
        let book = books[indexPath.row]
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.coverThumbnailImage.load(URL(book.coverImage), defaultImage: "defaultBookImage")
  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "BookDetail") as? BookDetailViewController {
                vc.bookSelectionDelegate = vc.self
                vc.book = books[indexPath.item]
                navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

// MARK: - Protocols

protocol BookSelectionDelegate {

    func didSelectBook(_ book: Book)

}
