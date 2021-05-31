//
//  PerfilView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 19/05/21.
//

import UIKit
import SnapKit

final class ProfileView: UIView {
    private(set) var scrollViewProfile = ScrollViewProfile()
    
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
        self.addSubview(scrollViewProfile)
    }
    
    private func setConstraints() {
        scrollViewProfile.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

