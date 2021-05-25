//
//  InfoView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 20/05/21.
//

import UIKit
import SnapKit

final class InfoView: UIView {
    
    var didTapBack: ((_ button: UIButton) -> Void)?
    
    private let logoContentView = UIView()
    
    private let buttonBack: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.backward")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "Black")
        button.setTitleColor(UIColor(named: "Black"), for: .normal)
        button.titleLabel?.font = Fonts.nunitoRegular(size: 20)
        button.addTarget(self, action:#selector(buttonBackClicked), for: .touchUpInside)
        button.setTitle("  Voltar", for: .normal)
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LogoHome")
        return image
    }()
    
    private let logoLabelTitle: UILabel = {
        let label = UILabel()
        label.text = "Rede de conexão para "
        label.font = Fonts.nunitoRegular(size: 20)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private let logoLabelTitleColor: UILabel = {
        let label = UILabel()
        label.text = "neurodiversos"
        label.font = Fonts.nunitoSemiBold(size: 20)
        label.textColor = UIColor(named: "LilacDark")
        return label
    }()
    
    private let logoLabelSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Aqui reconhecemos e integramos suas capacidades!"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = Fonts.nunitoRegular(size: 16)
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        label.textColor = UIColor(named: "Black")
        return label
    }()

    private let scrollViewInfo = ScrollViewInfo()
    
    @objc private func buttonBackClicked(sender: UIButton) {
        didTapBack?(sender)
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
        logoContentView.addSubview(buttonBack)
        logoContentView.addSubview(logoImageView)
        logoContentView.addSubview(logoLabelTitle)
        logoContentView.addSubview(logoLabelTitleColor)
        logoContentView.addSubview(logoLabelSubTitle)
        addSubview(scrollViewInfo)
    }
    
    private func setConstraints() {
        logoContentView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(324)
        }
        
        buttonBack.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(40)
            make.width.equalTo(106)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(buttonBack.snp_bottomMargin).offset(32)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(52)
            make.width.equalTo(151)
        }
        
        logoLabelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp_bottomMargin).offset(32)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(24)
            make.width.equalTo(300)
        }
        
        logoLabelTitleColor.snp.makeConstraints { (make) in
            make.top.equalTo(logoLabelTitle.snp_bottomMargin).offset(2)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(24)
            make.width.equalTo(300)
        }
        
        logoLabelSubTitle.snp.makeConstraints { (make) in
            make.top.equalTo(logoLabelTitleColor.snp_bottomMargin).offset(12)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(48)
            make.width.equalTo(300)
        }
        
        scrollViewInfo.snp.makeConstraints { (make) in
            make.top.equalTo(logoLabelSubTitle.snp_bottomMargin).offset(24)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

