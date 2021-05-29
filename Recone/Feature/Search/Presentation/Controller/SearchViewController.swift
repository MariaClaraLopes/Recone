//
//  SearchViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 15/05/21.
//

import UIKit
import Kingfisher

final class SearchViewController: UIViewController {
    private let customSearch = SearchView()
    private let errorSearch = UIView()
//    private let data: [User] = UserFactory.registerUser()
    private var usersResponse: [UsersResponse]?

    override func loadView() {
        self.view = customSearch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSearch.tableView.backgroundColor = UIColor(named: "LilacLight")
        customSearch.tableView.separatorColor = UIColor(named: "LilacDark")
        customSearch.tableView.dataSource = self
        customSearch.tableView.delegate = self
        customSearch.delegate = self
        
        makeRequest()
    }
    
    private func makeRequest() {
        ApiService.getUsers(endPoint: .users) { [weak self] result in
            switch result {
            case .success(let users):
                self?.usersResponse = users
                self?.customSearch.tableView.reloadData()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersResponse?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellSearch", for: indexPath) as? TableViewCellSearch else {
            return .init()
        }
        let url = URL(string: usersResponse?[indexPath.row].avatar ?? "")
        cell.cellImageView.kf.setImage(with: url)
        cell.cellNameLabel.text = usersResponse?[indexPath.row].name
        cell.cellOccupationLabel.text = usersResponse?[indexPath.row].occupation
        cell.cellLocalizationLabel.text = usersResponse?[indexPath.row].city
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(named: "LilacLight")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let user = data[indexPath.row]
        if let id = usersResponse?[indexPath.row].id {
            let detailVC = DetailViewController()
            detailVC.updateID(id: id)
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.modalTransitionStyle = .crossDissolve
            present(detailVC, animated: true, completion: nil)
        }
//        detailVC.updateUser(user: user)
    }
}

extension SearchViewController: SearchViewDelegate {
    func update(occupation: String) {
        ApiService.getUsers(occupation: occupation, endPoint: .occupation) { [weak self] result in
            switch result {
            case .success(let users):
                self?.usersResponse = users
                if users.count == 1 {
                    self?.customSearch.tableView.separatorColor = .clear
                } else {
                    self?.customSearch.tableView.separatorColor = UIColor(named: "LilacDark")
                }
                self?.customSearch.tableView.reloadData()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
