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
    var dataTask: URLSessionDataTask?
    
    // MARK: - Outlets
    
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Library"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        fetchBooks()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Book", for: indexPath) as! BookCell
        let book = books[indexPath.row]
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.bookCoverThumbnail.load(URL(book.cover_image))
  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "BookDetail") as? BookDetailViewController {
                vc.book = books[indexPath.item]
                navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    // MARK: - API Call Functions
    func fetchBooks() {
        dataTask?.cancel()

        guard let url = URL(string: "https://library-api-cw.herokuapp.com/books/?format=json") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { [self] (data, response, error) in
        
            let decoder = JSONDecoder()
    
            if let data = data {
                do {
                    books = try decoder.decode([Book].self, from: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch {
                    print(error)
                }
            }
        } )
        
        dataTask?.resume()
    }
    
    func showError() {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading books.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
}
