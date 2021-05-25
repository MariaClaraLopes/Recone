//
//  HomeViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 14/05/21.
//

import UIKit

final class HomeViewController: UIViewController {
    private let customHome = HomeView()
    private let data: [User] = UserFactory.registerUser()

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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = customHome.tableView.dequeueReusableCell(withIdentifier: "CellHome", for: indexPath) as? TableViewCellHome else {fatalError("Unabel to create cell")}
        cell.cellImageView.image = data[indexPath.row].image
        cell.cellNameLabel.text = data[indexPath.row].name
        cell.cellOccupationLabel.text = data[indexPath.row].occupation
        cell.cellCategoryLabel.text = data[indexPath.row].category
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





