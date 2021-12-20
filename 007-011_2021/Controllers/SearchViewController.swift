//
//  SearchViewController.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 18.12.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTableView: UITableView!
    
    //MARK: - Private properties
    
    private let networkService: NetworkService = NetworkService()
    private var searchingWords: [Word] = []
    
    //MARK: lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.dataSource = self
        searchTableView.delegate = self
    }
    
    //MARK: IBActions
    
    @IBAction func pressSearchButton(_ sender: Any) {
        let input = textField.text ?? "empty"
        networkService.findWord(word: input, completion: getSearchResult(result:))
    }
    
    //MARK: Functions
    
    func getSearchResult(result: Result<[Word], Error>) -> Void {
        switch result {
        case .success(let words):
            self.searchingWords = words
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
            print(words.count)
        case .failure(let error):
            print(error)
        }
    }

}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchingWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchTableView.dequeueReusableCell(withIdentifier: "WordTableViewCell", for: indexPath) as? WordTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(word: searchingWords[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
