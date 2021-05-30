//
//  LoginViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 19/05/21.
//

import UIKit

protocol LoginViewControllerDelegate {
    func update(id: String)
}

class LoginViewController: UIViewController {
    private let customLogin = LoginView()
    var delegate: LoginViewControllerDelegate?
    
    override func loadView() {
        self.view = customLogin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        customLogin.emailTextField.text = ""
        customLogin.passwordTextField.text = ""
    }
    
    private func bind() {
        customLogin.didTapOk = { [weak self] credential in
            guard let self = self else {return}
            
            let email: String = self.customLogin.emailTextField.text?.replacingOccurrences(of: " ", with: "") ?? ""
            let password: String = self.customLogin.passwordTextField.text?.replacingOccurrences(of: " ", with: "") ?? ""
            
//            let email: String = "Ana.Beatriz@gmail.com"
//            let password: String = "123456@Za"
            
            if email.isEmpty || password.isEmpty {
                self.customLogin.loginError()
            } else {
                ApiService.postSignIn(email: email, password: password) { [weak self] result in
                    switch result {
                    case .success(let user):
                        AppSession.updateUser(isLoggedIn: true)
                        self?.delegate?.update(id: user.id)
                        self?.dismiss(animated: true)
                    case .failure(let error):
                        self?.customLogin.loginError()
                        debugPrint(error)
                    }
                }
            }
            
//            if email.isEmpty || password.isEmpty {
//                self.customLogin.loginError()
//            } else if emailTextField != loginModel.email || passwordTextField != loginModel.password {
//                self.customLogin.loginError()
//            } else if emailTextField == loginModel.email && passwordTextField == loginModel.password{
//                AppSession.updateUser(isLoggedIn: true)
//                let user = self.makeUser()
//                self.delegate?.update(user: user)
//                self.makeController()
//            }
        }
        
        customLogin.didTapBack = { [weak self] button in
            self?.dismiss(animated: true)
        }
    }
}

