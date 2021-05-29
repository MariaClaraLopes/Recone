//
//  ProfileViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 17/05/21.
//

import UIKit
import SafariServices

final class ProfileViewController: UIViewController {
    
    private let customProfile = ProfileView()
        
    override func loadView() {
        self.view = customProfile
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bind()

    }
    
    private func bind() {
        customProfile.scrollViewProfile.didTapExit = { [weak self] button in
            self?.dismiss(animated: true)
        }
        
        customProfile.scrollViewProfile.didTapLinkJob = { [weak self] button, url in
            if let url = URL(string: "https://github.com/")
             {
               let safariVC = SFSafariViewController(url: url)
                self?.present(safariVC, animated: true, completion: nil)
             }
        }
    }
}

