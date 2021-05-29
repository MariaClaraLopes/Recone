//
//  GalleryItemView.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 23/05/21.
//

import UIKit
import Kingfisher

final class GalleryItemView: UIView {
    
    private let contentView: UIView = UIView()
    
    private let deviceWidth: CGFloat = UIScreen.main.bounds.width

    private let imageGalleryOne: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
            
    private let imageGalleryTwo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
    
    private let imageGalleryThree: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
    
    convenience init(imageOne: String, imageTwo: String, imageThree: String) {
        self.init(frame: .zero, imageOne: imageOne, imageTwo: imageTwo, imageThree: imageThree)
    }
    
    init(frame: CGRect, imageOne: String, imageTwo: String, imageThree: String) {
        super.init(frame: frame)
        imageGalleryOne.kf.setImage(with: URL(string: imageOne))
        imageGalleryTwo.kf.setImage(with: URL(string: imageTwo))
        imageGalleryThree.kf.setImage(with: URL(string: imageThree))

        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(imageGalleryOne)
        contentView.addSubview(imageGalleryTwo)
        contentView.addSubview(imageGalleryThree)
        addSubview(contentView)
    }
    
    private func setConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(96)
        }
        
        imageGalleryOne.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview()
            make.height.width.equalTo(96)
        }
        
        imageGalleryTwo.snp.makeConstraints { make in
            make.left.equalTo(imageGalleryOne.snp.right).offset(16)
            make.top.equalToSuperview()
            make.height.width.equalTo(96)
        }
        
        imageGalleryThree.snp.makeConstraints { make in
            make.left.equalTo(imageGalleryTwo.snp.right).offset(16)
            make.top.equalToSuperview()
            make.height.width.equalTo(96)
        }
    }
}

