//
//  ViewController.swift
//  library-ios
//
//  Created by Cassie Wallace on 10/17/22.
//

import UIKit

class ViewController: UICollectionViewController {
    // MARK: - Variables
    var books = [Book]()
    var dataTask: URLSessionDataTask?

    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Library"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        fetchBooks()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Book", for: indexPath) as! BookCell
        let book = books[indexPath.row]
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
  
        cell.title.text = book.title
        cell.author.text = book.author
  
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
                        self.collectionView.reloadData()
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
