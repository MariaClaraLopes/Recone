//
//  SearchView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 18/05/21.
//

import UIKit
import SnapKit

protocol SearchViewDelegate {
    func update(occupation: String)
}

final class SearchView: UIView, UISearchBarDelegate {
    var delegate: SearchViewDelegate?
    
    private let errorView = SearchErrorView()
    
    private let searchBar: UISearchTextField = {
        var search = UISearchTextField()
        search.placeholder = "Escolha uma profissão"
        search.layer.cornerRadius = 8
        search.layer.borderColor = UIColor(named: "LilacDark")?.cgColor
        search.layer.borderWidth = 2
        search.textColor = UIColor(named: "Black")
        search.keyboardType = .alphabet
        search.layer.backgroundColor = UIColor.white.cgColor
        search.backgroundColor = .white
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
        self.addSubview(errorView)
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
        
        errorView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(48)
            make.right.equalTo(-10)
            make.left.bottom.equalToSuperview()
        }

    }
    
    func switchErrorView(isHidden: Bool) {
        self.errorView.isHidden = isHidden
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let occupation = textField.text {
            let formatOcuppation = occupation.replacingOccurrences(of: " ", with: "%20")
            delegate?.update(occupation: formatOcuppation)
        }
        textField.resignFirstResponder()
        return true
    }
}



