//
//  DetailView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 21/05/21.
//

import UIKit
import SnapKit

final class DetailView: UIView {
    private(set) var scrollViewDetail = ScrollViewDetail()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "LilacLight")
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(scrollViewDetail)
    }
    
    private func setConstraints() {
        scrollViewDetail.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

