//
//  AchievementItemView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 23/05/21.
//

import UIKit

final class AchievementItemView: UIView {
    private let contentView: UIView = UIView()
    
    private let deviceWidth: CGFloat = UIScreen.main.bounds.width

    private let imageAchievements: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ImageAchievements")
        image.contentMode = .scaleAspectFit
        return image
    }()
            
    private let achievementSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoSemiBold(size: 16)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private let dateAchievementLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 14)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    convenience init(title: String, subTitle: String) {
        self.init(frame: .zero, title: title, subTitle: subTitle)
    }
    
    init(frame: CGRect, title: String, subTitle: String) {
        super.init(frame: frame)
        achievementSubTitleLabel.text = title
        dateAchievementLabel.text = subTitle
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(imageAchievements)
        contentView.addSubview(achievementSubTitleLabel)
        contentView.addSubview(dateAchievementLabel)
        addSubview(contentView)
    }
    
    private func setConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(48)
        }
        
        imageAchievements.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(38)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        achievementSubTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageAchievements.snp.right).offset(24)
            make.top.equalToSuperview()
            make.width.equalTo(deviceWidth - 96)
            make.height.equalTo(24)
        }
        
        dateAchievementLabel.snp.makeConstraints { make in
            make.left.equalTo(imageAchievements.snp.right).offset(24)
            make.bottom.equalToSuperview()
            make.width.equalTo(deviceWidth - 180)
            make.height.equalTo(24)
        }
    }
}

