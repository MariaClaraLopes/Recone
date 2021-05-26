//
//  SearchView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 18/05/21.
//

import UIKit
import SnapKit

final class SearchView: UIView {
    
    private let searchBar: UISearchTextField = {
        let search = UISearchTextField()
        search.placeholder = "Escolha uma profissão"
        search.layer.cornerRadius = 8
        search.layer.borderColor = UIColor(named: "LilacDark")?.cgColor
        search.layer.borderWidth = 2
        search.keyboardType = .alphabet
        return search
    }()
    
    private(set) var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 142
        table.showsVerticalScrollIndicator = false
        table.register(TableViewCellSearch.self, forCellReuseIdentifier: "CellSearch")
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "LilacLight")
        setupTap()
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        self.endEditing(true)
    }
    
    private func setupView() {
        searchBar.delegate = self
        self.addSubview(searchBar)
        self.addSubview(tableView)
    }
    
    private func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(52)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(30)
            make.right.equalTo(-10)
            make.left.bottom.equalToSuperview()
        }
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text)
        textField.resignFirstResponder()
        return true
    }
}

