//
//  HomeView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 14/05/21.
//

import UIKit
import SnapKit

final class HomeView: UIView {
    var didTapInfo: ((_ button: UIButton) -> Void)?
    
    private let logoContentView = UIView()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LogoHome")
        return image
    }()
    
    private let buttonInfo: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "ButtonInfo")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "LilacDark")
        button.setTitleColor(UIColor(named: "LilacDark"), for: .normal)
        button.addTarget(self, action:#selector(buttonInfoClicked), for: .touchUpInside)
        return button
    }()
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "Esses são os profissionais de destaque na nossa plataforma, seus talentos estão brilhando."
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = Fonts.nunitoRegular(size: 16)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private(set) var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 142
        table.separatorColor = .purple
        table.showsVerticalScrollIndicator = false
        table.alwaysBounceVertical =  false
        table.register(TableViewCellHome.self, forCellReuseIdentifier: "CellHome")
        return table
    }()
    
    @objc private func buttonInfoClicked(sender: UIButton) {
        didTapInfo?(sender)
    }
    
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
        addSubview(logoContentView)
        logoContentView.addSubview(logoImageView)
        logoContentView.addSubview(buttonInfo)
        logoContentView.addSubview(logoLabel)
        
        addSubview(tableView)
    }
    
    private func setConstraints() {
        logoContentView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(188)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(72)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(52)
            make.width.equalTo(151)
        }
        
        buttonInfo.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(78)
            make.right.equalToSuperview().offset(-18)
            make.height.equalTo(36)
            make.width.equalTo(85)
        }
        
        logoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp_bottomMargin).offset(18)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(72)
            make.width.equalTo(317)
        }

        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(logoContentView.snp_bottomMargin).offset(30)
            make.right.equalTo(-10)
            make.left.bottom.equalToSuperview()
        }
    }
}



