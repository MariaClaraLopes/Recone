//
//  SearchErrorView.swift
//  Recone
//
//  Created by Maria Clara Lopes on 30/05/21.
//

import UIKit
import SnapKit

class SearchErrorView: UIView {
    
    private let logoContentView = UIView()
    
    private let logoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Poxa, ainda não temos esse profissional por aqui..."
//        label.font = Fonts.nunitoRegular(size: 20)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "Arial", size: 20)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private let logoSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lembre-se que você deve realizar buscas pela profissão da pessoa que deseja contratar."
//        label.font = Fonts.nunitoRegular(size: 16)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "Arial", size: 16)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private let imageSearchErrorView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "SearchError")
        return image
    }()
    
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
        logoContentView.addSubview(logoTitleLabel)
        logoContentView.addSubview(logoSubTitleLabel)
        logoContentView.addSubview(imageSearchErrorView)
    }
    
    private func setConstraints() {
        logoContentView.snp.makeConstraints { (make) in
//            make.top.equalTo(searhBar.snp.bottom).offset(48)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(356)
            make.left.right.equalToSuperview()
        }
        
        logoTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().offset(-38)
        }
        
        logoSubTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoTitleLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.height.equalTo(72)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().offset(-38)
        }
        
        imageSearchErrorView.snp.makeConstraints { make in
            make.top.equalTo(logoSubTitleLabel.snp.bottom).offset(38)
            make.centerX.equalToSuperview()
            make.height.equalTo(154)
            make.width.equalTo(200)
        }

    }
}
