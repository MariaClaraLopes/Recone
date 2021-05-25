//
//  TableViewCellSearch.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 18/05/21.
//

import UIKit
import SnapKit

final class TableViewCellSearch: UITableViewCell {
    
    private(set) var cellImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 28
        image.clipsToBounds = true
        return image
    }()
    
    private(set) var cellNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoSemiBold(size: 14)
        label.textAlignment = .left
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private(set) var cellOccupationLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 14)
        label.textAlignment = .left
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private(set) var cellLocalizationLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 14)
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        addSubview(cellImageView)
        addSubview(cellNameLabel)
        addSubview(cellOccupationLabel)
        addSubview(cellLocalizationLabel)
    }

    private func setConstraints() {
        cellImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(33)
            make.width.height.equalTo(56)
        }
        
        cellNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(35)
            make.left.equalTo(cellImageView.snp_rightMargin).offset(24)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(20)
        }

        cellOccupationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cellNameLabel.snp_bottomMargin).offset(9)
            make.left.equalTo(cellImageView.snp_rightMargin).offset(24)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(20)
        }
        
        cellLocalizationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cellOccupationLabel.snp_bottomMargin).offset(12)
            make.left.equalTo(cellImageView.snp_rightMargin).offset(24)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(28)
        }
    }
}


