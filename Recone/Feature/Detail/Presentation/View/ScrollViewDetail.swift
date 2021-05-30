//
//  ScrollViewDetail.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 21/05/21.
//

import UIKit
import SnapKit

final class ScrollViewDetail: UIView {
    
    private var url: URL? = nil
    
    var didTapBack: ((_ button: UIButton) -> Void)?
    
    var didTapLinkJob: ((_ button: UIButton, _ url: URL) -> Void)?
    
    private let deviceWidth: CGFloat = UIScreen.main.bounds.width
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = false
        scrollView.bounces = false
        return scrollView
    }()
    private let wrapperView = UIView()

    private let containerView: UIView = {
        let view = UIView()
        return view
    }()

    private let contentBox: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 24
        stack.backgroundColor = UIColor(named: "LilacLight")
        return stack
    }()
    
    private let profileContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PurpleMedium")
        return view
    }()
    
    private let buttonBack: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.backward")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "White")
        button.setTitleColor(UIColor(named: "White"), for: .normal)
        button.titleLabel?.font = Fonts.nunitoRegular(size: 20)
        button.addTarget(self, action:#selector(buttonBackClicked), for: .touchUpInside)
        button.setTitle("  Voltar", for: .normal)
        return button
    }()
    
    private let imageProfileView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 42
        image.clipsToBounds = true
        return image
    }()
    
    private let nameProfileLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoSemiBold(size: 24)
        label.textAlignment = .left
        label.textColor = UIColor(named: "White")
        return label
    }()
    
    private let categoryProfileLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 20)
        label.textColor = UIColor(named: "White")
        return label
    }()
    
    private let localizationProfileLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 16)
        label.textColor = UIColor(named: "White")
        return label
    }()

    private let contactNumberProfileLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.nunitoRegular(size: 16)
        label.textColor = UIColor(named: "White")
        return label
    }()

    private let linkJobContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Yellow")
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let buttonLinkJob: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor(named: "Black"), for: .normal)
        button.titleLabel?.font = Fonts.nunitoSemiBold(size: 16)
        button.addTarget(self, action:#selector(buttonLinkJobClicked), for: .touchUpInside)
        return button
    }()
    
    private(set) var biographyView = BiographyView()
    
    private(set) var achievementsView = AchievementsView()
    
    private let galleryTitle: UILabel = {
        let label = UILabel()
        label.text = "Galeria"
        label.font = Fonts.nunitoSemiBold(size: 20)
        label.textColor = UIColor(named: "LilacDark")
        return label
    }()
    
    private(set) var galleryView = GalleryView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTap()
        setupView()
        setConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonLinkJobClicked(sender: UIButton) {
        if let url = url {
            didTapLinkJob?(sender, url)
        }
    }
    
    @objc private func buttonBackClicked(sender: UIButton) {
        didTapBack?(sender)
    }

    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapBackground))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }

    private func setupView() {
        profileContentView.addSubview(buttonBack)
        profileContentView.addSubview(imageProfileView)
        profileContentView.addSubview(nameProfileLabel)
        profileContentView.addSubview(categoryProfileLabel)
        profileContentView.addSubview(localizationProfileLabel)
        profileContentView.addSubview(contactNumberProfileLabel)
        profileContentView.addSubview(linkJobContentView)
        linkJobContentView.addSubview(buttonLinkJob)
        contentBox.addArrangedSubview(profileContentView)
        contentBox.addArrangedSubview(biographyView)
        contentBox.addArrangedSubview(achievementsView)
        contentBox.addArrangedSubview(galleryView)
        containerView.addSubview(contentBox)
        wrapperView.addSubview(containerView)
        scrollView.addSubview(wrapperView)
        addSubview(scrollView)
    }

    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-50)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }

        wrapperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentBox.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(44)
        }
        
        profileContentView.snp.makeConstraints { make in
            make.height.equalTo(370)
        }
        
        buttonBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(40)
            make.width.equalTo(106)
        }

        imageProfileView.snp.makeConstraints { make in
            make.top.equalTo(buttonBack.snp.bottom).offset(80)
            make.left.equalToSuperview().offset(24)
            make.width.height.equalTo(85)
        }

        nameProfileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.left.equalTo(imageProfileView.snp.right).offset(24)
            make.height.equalTo(28)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
        }
        
        categoryProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(nameProfileLabel.snp.bottom).offset(24)
            make.left.equalTo(imageProfileView.snp.right).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
        }
        
        localizationProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryProfileLabel.snp.bottom).offset(14)
            make.left.equalTo(imageProfileView.snp.right).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
        }
        
        contactNumberProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(localizationProfileLabel.snp.bottom).offset(8)
            make.left.equalTo(imageProfileView.snp.right).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
        }
        
        linkJobContentView.snp.makeConstraints { make in
            make.top.equalTo(contactNumberProfileLabel.snp_bottomMargin).offset(26)
            make.left.equalTo(imageProfileView.snp.right).offset(24)
            make.height.equalTo(40)
            make.width.equalTo(109)
        }
        
        buttonLinkJob.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
    }

    @objc private func didTapBackground() {
        endEditing(true)
    }
    
    func updateImage(image: UIImage) {
        imageProfileView.image = image
    }

    func updateName(name: String) {
        nameProfileLabel.text = name
    }

    func updateCategory(category: String) {
        categoryProfileLabel.text = category
    }

    func updateLocalization(localization: String) {
        localizationProfileLabel.text = localization
    }

    func updateContactNumber(contactNumber: String) {
        contactNumberProfileLabel.text = contactNumber
    }
    
    func updateUI(user: UserResponse) {
        if let link = user.links?[0].url, let name = user.links?[0].name {
            self.url = URL(string: link)
            buttonLinkJob.setTitle(name, for: .normal)
        }
        let urlImage = URL(string: user.avatar)
        imageProfileView.reconeImageDownloader(with: urlImage)
        nameProfileLabel.text = user.name
        categoryProfileLabel.text = user.categorie
        localizationProfileLabel.text = user.city
        contactNumberProfileLabel.text = user.phone
        biographyView.updateOccupation(occupation: user.occupation)
        biographyView.updateAge(age: String(user.age))
        biographyView.updateText(text: user.description)
    }
}

extension ScrollViewDetail {
    struct Dimension {
        static let widthOffset: CGFloat = 48.0
    }
}


