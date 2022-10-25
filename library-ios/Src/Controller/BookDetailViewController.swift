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
    @IBOutlet var tableView: UITableView!
    
    // MARK: - UIViewController Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Functions
    
    private func setupView() {
        title = book?.title
        navigationItem.largeTitleDisplayMode = .never
        
        tableView.delegate = self
        tableView.dataSource = self
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
