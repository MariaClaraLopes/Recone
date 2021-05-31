//
//  SearchViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 15/05/21.
//

import UIKit

final class SearchViewController: UIViewController {
    private let customSearch = SearchView()
    private var usersResponse: [UsersResponse]?

    override func loadView() {
        self.view = customSearch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeRequest()
    }
    
    private func setupUI() {
        customSearch.switchErrorView(isHidden: true)
        customSearch.tableView.backgroundColor = UIColor(named: "LilacLight")
        customSearch.tableView.separatorColor = UIColor(named: "LilacDark")
        customSearch.tableView.dataSource = self
        customSearch.tableView.delegate = self
        customSearch.delegate = self
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
        cell.cellImageView.reconeImageDownloader(with: url)
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
        if let id = usersResponse?[indexPath.row].id {
            let detailVC = DetailViewController()
            detailVC.updateID(id: id)
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.modalTransitionStyle = .crossDissolve
            present(detailVC, animated: true, completion: nil)
        }
    }
}

extension SearchViewController: SearchViewDelegate {
    func update(occupation: String) {
        ApiService.getUsers(occupation: occupation, endPoint: .occupation) { [weak self] result in
            switch result {
            case .success(let users):
                self?.customSearch.switchErrorView(isHidden: true)
                self?.usersResponse = users
                if users.isEmpty {
                    self?.customSearch.switchErrorView(isHidden: false)
                } else if users.count == 1 {
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
