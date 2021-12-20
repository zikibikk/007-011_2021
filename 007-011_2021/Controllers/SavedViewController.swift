//
//  SavedViewController.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 19.12.2021.
//

import UIKit

class SavedViewController: UIViewController {

    @IBOutlet weak var savedTableView: UITableView!
    
    var savedWords: [Word] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedTableView.dataSource = self
        savedTableView.delegate = self
        savedTableView.rowHeight = UITableView.automaticDimension;
        savedTableView.estimatedRowHeight = 500.0
    }
}

// MARK: - UITableViewDataSource
extension SavedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        savedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = savedTableView.dequeueReusableCell(withIdentifier: "WordTableViewCell", for: indexPath) as? WordTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(word: savedWords[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SavedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
