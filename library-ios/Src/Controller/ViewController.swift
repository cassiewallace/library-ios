//
//  ViewController.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/17/22.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: - Variables
    
    var books = [Book]()
    
    // MARK: - Delegates
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Library"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getBooks()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Book", for: indexPath) as! BookCell
        let book = books[indexPath.row]
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.coverThumbnailImage.load(URL(book.cover_image))
  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "BookDetail") as? BookDetailViewController {
                vc.book = books[indexPath.item]
                navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Internal Functions

    func getBooks() {
        DataStore.getBooks() { books in
            guard let books = books else {
                self.showError()
                return
            }
            
            self.books = books
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    func showError() {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading books.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
}
