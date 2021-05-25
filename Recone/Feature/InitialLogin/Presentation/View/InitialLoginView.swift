//
//  InitialLoginView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 18/05/21.
//

import UIKit
import SnapKit

final class InitialLoginView: UIView {
    
    var didTapOk: ((_ button: UIButton) -> Void)?
    
    private let mainImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "InitialLogin")
        return image
    }()
    
    private let mainContentView = UIView()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "InitialLoginLogo")
        return image
    }()
    
    private let logotitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rede de conexão para neurodiversos"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Fonts.nunitoSemiBold(size: 20)
        label.textColor = UIColor(named: "White")
        return label
    }()
    
    private let logosubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Aqui reconhecemos e integramos suas capacidades!"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Fonts.nunitoRegular(size: 16)
        label.textColor = UIColor(named: "White")
        return label
    }()
    
    private let buttonEnterContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Yellow")
        view.layer.cornerRadius = 32
        return view
    }()
    
    private let buttonEnter: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FAZER LOGIN", for: .normal)
        button.backgroundColor = UIColor(named: "Yellow")
        button.tintColor = UIColor(named: "Black")
        button.titleLabel?.font = Fonts.nunitoSemiBold(size: 18)
        button.addTarget(self, action:#selector(buttonEnterClicked), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonEnterClicked(sender: UIButton) {
        didTapOk?(sender)
    }
    
    private func setupView() {
        addSubview(mainImageView)
        addSubview(mainContentView)
        mainContentView.addSubview(logoImageView)
        mainContentView.addSubview(logotitleLabel)
        mainContentView.addSubview(logosubTitleLabel)
        addSubview(buttonEnterContentView)
        buttonEnterContentView.addSubview(buttonEnter)
    }
    
    private func setConstraints() {
        mainImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        mainContentView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(52)
            make.width.equalTo(182)
        }
        
        logotitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(85)
            make.right.equalToSuperview().offset(-85)
            make.height.equalTo(58)
        }
        
        logosubTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logotitleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            make.height.equalTo(48)
        }
        
        buttonEnterContentView.snp.makeConstraints { (make) in
            make.top.equalTo(logosubTitleLabel.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(179)
        }
        
        buttonEnter.snp.makeConstraints { (make) in
            make.centerY.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
    }
}



