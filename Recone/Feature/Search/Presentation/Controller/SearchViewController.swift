//
//  SearchViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 15/05/21.
//

import UIKit

final class SearchViewController: UIViewController {
    private let customSearch = SearchView()
    private let data: [User] = UserFactory.registerUser()

    override func loadView() {
        super.loadView()
        self.view = customSearch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSearch.tableView.backgroundColor = UIColor(named: "LilacLight")
        customSearch.tableView.separatorColor = UIColor(named: "LilacDark")
        customSearch.tableView.dataSource = self
        customSearch.tableView.delegate = self
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellSearch", for: indexPath) as? TableViewCellSearch else {
            return .init()
        }
        cell.cellImageView.image = data[indexPath.row].image
        cell.cellNameLabel.text = data[indexPath.row].name
        cell.cellOccupationLabel.text = data[indexPath.row].occupation
        cell.cellLocalizationLabel.text = data[indexPath.row].localization
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.init(named: "LilacLight")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = data[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.updateUser(user: user)
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.modalTransitionStyle = .crossDissolve
        present(detailVC, animated: true, completion: nil)
    }
}

