//
//  ScrollViewInfo.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 21/05/21.
//

import UIKit
import SnapKit

final class ScrollViewInfo: UIView {
    private let deviceWidth: CGFloat = UIScreen.main.bounds.width
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let wrapperView = UIView()

    private let containerView = UIView()

    private let contentBox: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    private let imageInfoOne: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ImageInfoOne")
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let contentTitleOneLabel: UILabel = {
        let label = UILabel()
        label.text = "\n\nNossa plataforma foi criada para dar visibilidade às pessoas do espectro e seus talentos.\n\nBuscamos derrubar as barreiras do preconceito e do capacitismo para que clientes e recrutadores enxerguem o potencial dos profissionais e os contrate!\n\n"
        label.numberOfLines = 0
        label.textColor = UIColor(named: "Black")
        label.font = Fonts.nunitoRegular(size: 16)
        return label
    }()
    
    private let imageInfoTwo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ImageInfoTwo")
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let contentTitleTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "\n\nO fato é que o mundo está mudando e nós precisamos acompanhá-lo. A diversidade, igualdade e inclusão passaram a ser mais do que pautas, são exigências.\n\nE nós da Recone acreditamos que excelentes profissionais neurodiversos são invisibilizados, por isso, decidimos dar luz e espaço para eles mostrarem seus talentos e serem reconhecidos por eles!"
        label.numberOfLines = 0
        label.textColor = UIColor(named: "Black")
        label.font = Fonts.nunitoRegular(size: 16)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTap()
        setupView()
        setConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapBackground))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }

    private func setupView() {
        contentBox.addArrangedSubview(imageInfoOne)
        contentBox.addArrangedSubview(contentTitleOneLabel)
        contentBox.addArrangedSubview(imageInfoTwo)
        contentBox.addArrangedSubview(contentTitleTwoLabel)
        containerView.addSubview(contentBox)
        wrapperView.addSubview(containerView)
        scrollView.addSubview(wrapperView)
        addSubview(scrollView)
    }

    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
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
            make.left.top.equalToSuperview().inset(24)
            make.width.equalTo(deviceWidth - Dimension.widthOffset)
            make.bottom.equalToSuperview().inset(44)
        }
        
        imageInfoOne.snp.makeConstraints { make in
            make.height.equalTo(180)
        }
        
        imageInfoTwo.snp.makeConstraints { make in
            make.height.equalTo(180)
        }
    }

    @objc private func didTapBackground() {
        endEditing(true)
    }
}

extension ScrollViewInfo {
    struct Dimension {
        static let widthOffset: CGFloat = 48.0
    }
}


