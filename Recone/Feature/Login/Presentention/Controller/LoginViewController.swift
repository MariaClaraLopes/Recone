//
//  LoginViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 19/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    private let customLogin = LoginView()
    
    override func loadView() {
        super.loadView()
        self.view = customLogin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        let loginModel = LoginModel()
        customLogin.didTapOk = { [weak self] credential in
            guard let self = self else {return}
            let emailTextField: String = self.customLogin.emailTextField.text ?? ""
            let passwordTextField: String = self.customLogin.passwordTextField.text ?? ""
            if emailTextField.isEmpty || passwordTextField.isEmpty {
                self.customLogin.loginError()
            } else if emailTextField != loginModel.email || passwordTextField != loginModel.password {
                self.customLogin.loginError()
            } else {
                let user = self.makeUser()
                self.makeController(user: user)
            }
        }
        
        customLogin.didTapBack = { [weak self] button in
            self?.dismiss(animated: true)
        }
    }
    
    private func makeController(user: User) {
        customLogin.didTapOk = { [weak self] button in
            let profileVC = ProfileViewController()
            profileVC.updateUser(user: user)
            profileVC.modalPresentationStyle = .fullScreen
            self?.present(profileVC, animated: true, completion: nil)
            
            AppSession.updateUser(isLoggedIn: true)
        }
    }
    
    private func makeUser() -> User {
        let user = User(image: UIImage(named: "TestImage1"),
                    name: "Maria Clara",
                    age: "23 anos",
                    category: "Tecnologia",
                    occupation: "Desenvolvedor iOS",
                    localization: "Belo Horizonte",
                    contactNumber: "(11) 32820-4281")
        
        return user
    }
}

