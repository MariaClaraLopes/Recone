//
//  InfoViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 20/05/21.
//

import UIKit

final class InfoViewController: UIViewController {
    private let customInfo = InfoView()

    override func loadView() {
        self.view = customInfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        customInfo.didTapBack = { [weak self] button in
            self?.dismiss(animated: true)
        }
    }
    
}

