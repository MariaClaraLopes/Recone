//
//  GalleryView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 23/05/21.
//

import UIKit

final class GalleryView: UIView {
    private let contentView: UIView = UIView()
    
    private let deviceWidth: CGFloat = UIScreen.main.bounds.width
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Galeria"
        label.font = Fonts.nunitoSemiBold(size: 20)
        label.textColor = UIColor(named: "LilacDark")
        return label
    }()
    
    private let contentBox: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 16
        stack.backgroundColor = UIColor(named: "LilacLight")
        return stack
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentBox)
        addSubview(contentView)
    }
    
    private func setConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().inset(24)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
            make.height.equalTo(32)
        }
        
        contentBox.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    private func clearStack() {
        for view in self.contentBox.subviews {
            view.removeFromSuperview()
        }
    }
    
    func updateLayout(gallerys: [GalleryModel]) {
        clearStack()
        for gallery in gallerys {
            let item = GalleryItemView(imageOne: gallery.imageGalleryOne, imageTwo: gallery.imageGalleryTwo, imageThree: gallery.imageGalleryThree)
            contentBox.addArrangedSubview(item)
        }
    }
}

extension GalleryView {
    struct GalleryModel {
        let imageGalleryOne: String
        let imageGalleryTwo: String
        let imageGalleryThree: String
    }
    
    struct Dimension {
        static let widthOffset: CGFloat = 48.0
    }
}

