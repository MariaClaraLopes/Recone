//
//  TableViewCell.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 16/05/21.
//

import UIKit
import SnapKit

final class TableViewCellHome: UITableViewCell {
    
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
//        label.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        label.textAlignment = .left
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private(set) var cellOccupationLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 14)
//        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textAlignment = .left
        label.textColor = UIColor(named: "Black")
        return label
    }()
    
    private(set) var cellCategoryContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "LilacDark")
        view.layer.cornerRadius = 15
        return view
    }()
    
    private(set) var cellCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 14)
//        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textColor = UIColor(named: "White")
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
        addSubview(cellCategoryContentView)
        cellCategoryContentView.addSubview(cellCategoryLabel)
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

        cellCategoryContentView.snp.makeConstraints { (make) in
            make.top.equalTo(cellOccupationLabel.snp_bottomMargin).offset(16)
            make.left.equalTo(cellImageView.snp_rightMargin).offset(24)
            make.right.equalToSuperview().offset(-162)
            make.height.equalTo(28)
        }

        cellCategoryLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }

    }
}



