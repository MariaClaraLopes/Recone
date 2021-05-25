//
//  InitialLoginViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 18/05/21.
//

import UIKit

final class InitialLoginViewController: UIViewController {
    private let customInitialLogin = InitialLoginView()
    private let customLogin = LoginView()
    private let customProfile = ProfileView()

    override func loadView() {
        super.loadView()
        self.view = customInitialLogin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        if AppSession.isUserLoggedIn() {
//            self.view = customProfile
//        } else {
//            self.view = customInitialLogin
//        }
//    }
    
    private func bind() {
        customInitialLogin.didTapOk = { [weak self] button in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self?.present(loginVC, animated: true, completion: nil)
        }
        
//        customProfile.scrollViewProfile.didTapExit = { [weak self] button in
//            AppSession.updateUser(isLoggedIn: false)
//            self?.dismiss(animated: true)
//        }
    }
}

