//
//  BiographyView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 23/05/21.
//

import UIKit

final class BiographyView: UIView {
    
    private let contentView: UIView = UIView()
    
    private let deviceWidth: CGFloat = UIScreen.main.bounds.width

    private let biographyTitle: UILabel = {
        let label = UILabel()
        label.text = "Sobre mim"
        label.font = Fonts.nunitoSemiBold(size: 20)
        label.textColor = UIColor(named: "LilacDark")
        return label
    }()
    
    private let occupationSubTitle: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoSemiBold(size: 18)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private let ageSubTitle: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 18)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private let textAbout: UILabel = {
        let label = UILabel()
        label.text = "Em 2018, depois de me aposentar, passei a me interessar por tecnologia e desde então venho aprimorando minhas habilidades como Dev Backend. Criei um grupo de apoio para mulheres desenvolvedoras online no Whatsapp para compartilhar conhecimento e continuar evoluindo! Nunca é tarde demais para adquirir novas habilidades."
        label.numberOfLines = 0
        label.font = Fonts.nunitoRegular(size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = UIColor(named: "LilacLight")
        contentView.addSubview(biographyTitle)
        contentView.addSubview(occupationSubTitle)
        contentView.addSubview(ageSubTitle)
        contentView.addSubview(textAbout)
        addSubview(contentView)
    }
    
    private func setConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(328)
        }
        
        biographyTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview()
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
            make.height.equalTo(32)
        }
        
        occupationSubTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(biographyTitle.snp.bottom).offset(24)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
            make.height.equalTo(28)
        }
        
        ageSubTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(occupationSubTitle.snp.bottom).offset(10)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
            make.height.equalTo(28)
        }
        
        textAbout.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(ageSubTitle.snp.bottom).offset(18)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
            make.height.greaterThanOrEqualTo(192)
        }
    }

    func updateOccupation(occupation: String) {
        occupationSubTitle.text = occupation
    }
    
    func updateAge(age: String) {
        ageSubTitle.text = age
    }
}

extension BiographyView {
    struct Dimension {
        static let widthOffset: CGFloat = 48.0
    }
}

