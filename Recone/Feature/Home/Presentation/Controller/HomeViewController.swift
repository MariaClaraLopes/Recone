//
//  HomeViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 14/05/21.
//

import UIKit

final class HomeViewController: UIViewController {
    private let customHome = HomeView()
//    private let data: [User] = UserFactory.registerUser()
    private var usersResponse: [UsersResponse]?

    override func loadView() {
        self.view = customHome
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customHome.tableView.backgroundColor = UIColor(named: "LilacLight")
        customHome.tableView.separatorColor = UIColor(named: "LilacDark")
        customHome.tableView.dataSource = self
        customHome.tableView.delegate = self
        bind()
        makeRequest()
    }
    
    private func makeRequest() {
        ApiService.getUsers(endPoint: .usersFavorites) { [weak self] result in
            switch result {
            case .success(let users):
                self?.usersResponse = users
                self?.customHome.tableView.reloadData()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func bind() {
        customHome.didTapInfo = { [weak self] button in
            let infoVC = InfoViewController()
            infoVC.modalPresentationStyle = .popover
            self?.present(infoVC, animated: true, completion: nil)
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersResponse?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = customHome.tableView.dequeueReusableCell(withIdentifier: "CellHome", for: indexPath) as? TableViewCellHome else {fatalError("Unabel to create cell")}
        let url = URL(string: usersResponse?[indexPath.row].avatar ?? "")
        cell.cellImageView.kf.setImage(with: url)
        cell.cellNameLabel.text = usersResponse?[indexPath.row].name
        cell.cellOccupationLabel.text = usersResponse?[indexPath.row].occupation
        cell.cellCategoryLabel.text = usersResponse?[indexPath.row].categorie
        
        
//        cell.cellImageView.image = data[indexPath.row].image
//        cell.cellNameLabel.text = data[indexPath.row].name
//        cell.cellOccupationLabel.text = data[indexPath.row].occupation
//        cell.cellCategoryLabel.text = data[indexPath.row].category
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.init(named: "LilacLight")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let user = data[indexPath.row]
        if let id = usersResponse?[indexPath.row].id {
            let detailVC = DetailViewController()
            detailVC.updateID(id: id)
    //        detailVC.updateUser(user: user)
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.modalTransitionStyle = .crossDissolve
            present(detailVC, animated: true, completion: nil)
        }
    }
}
