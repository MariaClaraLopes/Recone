//
//  LoginView.swift
//  LoginScreen
//
//  Created by Maria Clara Lopes on 11/05/21.
//

import UIKit
import SnapKit

final class LoginView: UIView {
    
    var didTapOk: (((email: String, password: String)) -> Void)?
    
    var didTapBack: ((_ button: UIButton) -> Void)?
    
    private let mainImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "Login")
        return image
    }()
    
    private let buttonBack: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.backward")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.nunitoRegular(size: 20)
        button.addTarget(self, action:#selector(buttonBackClicked), for: .touchUpInside)
        button.setTitle("  Voltar", for: .normal)
        return button
    }()

    private let logoContentView = UIView()
    
    private let logotitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Faça seu login"
        label.textAlignment = .center
        label.font = Fonts.nunitoRegular(size: 24)
        label.textColor = UIColor(named: "White")
        return label
    }()
        
    private let loginContentView = UIView()
    
    private let emailLabelContentView = UIView()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = Fonts.nunitoRegular(size: 16)
        label.textColor = UIColor(named: "White")
        return label
    }()
    
    private let emailContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "White")
        view.layer.cornerRadius = 8
        return view
    }()
    
    private(set) var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor =  UIColor(named: "White")
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string: "Insira seu email",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "GrayMedium") ?? .gray])
        textField.addTarget(self, action:#selector(emailChangeColorClickedTextField), for: .touchUpInside)
        textField.textColor =  UIColor(named: "Black")
        return textField
    }()
    
    private let passwordLabelContentView = UIView()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.font = Fonts.nunitoRegular(size: 16)
        label.textColor = UIColor(named: "White")
        return label
    }()
    
    private let passwordContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "White")
        view.layer.cornerRadius = 8
        return view
    }()
    
    private(set) var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "White")
        textField.keyboardType = .numbersAndPunctuation
        textField.attributedPlaceholder = NSAttributedString(string: "Insira a sua senha",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "GrayMedium") ?? .gray])
        textField.addTarget(self, action:#selector(passwordChangeColorClickedTextField), for: .touchUpInside)
        textField.textColor =  UIColor(named: "Black")
        return textField
    }()
    
    private let passwordHideButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "Eye")
        button.tintColor = UIColor(named: "LilacMedium")
        button.setImage(image, for: .normal)
        button.addTarget(self, action:#selector(buttonHideClicked), for: .touchUpInside)
        return button
    }()
    
    private let buttonEnterContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PurpleDark")
        view.layer.cornerRadius = 32
        return view
    }()
    
    private let buttonEnter: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ENTRAR", for: .normal)
        button.backgroundColor = UIColor(named: "PurpleDark")
        button.tintColor = UIColor(named: "White")
        button.titleLabel?.font = Fonts.nunitoSemiBold(size: 18)
        button.addTarget(self, action:#selector(buttonEnterClicked), for: .touchUpInside)
        return button
    }()
    
    private let imageErrorEmailView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "xmark")
        image.tintColor = UIColor(named: "RedMedium")
        return image
    }()
    
    private let imageErrorPasswordView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "xmark")
        image.tintColor = UIColor(named: "RedMedium")
        return image
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Credenciais inválidas!"
        label.textColor = UIColor(named: "RedLightMedium")
        label.font = Fonts.nunitoRegular(size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "White")
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonHideClicked() {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            let image = UIImage.init(named: "EyeHide")
            passwordHideButton.setImage(image, for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            let image = UIImage.init(named: "Eye")
            passwordHideButton.setImage(image, for: .normal)
        }
    }
    
    @objc private func buttonBackClicked(sender: UIButton) {
        didTapBack?(sender)
    }
    
    @objc private func buttonEnterClicked(sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        didTapOk?((email: email, password: password))
    }
    
    private func setupView() {
        setupTap()
        setupisHidden(isHidden: true)
        
        addSubview(mainImageView)
        addSubview(buttonBack)
        
        addSubview(logoContentView)
        
        logoContentView.addSubview(logotitleLabel)
        
        addSubview(loginContentView)
        loginContentView.addSubview(emailLabelContentView)
        emailLabelContentView.addSubview(emailLabel)
        loginContentView.addSubview(emailContentView)
        emailContentView.addSubview(emailTextField)
        loginContentView.addSubview(passwordLabelContentView)
        passwordLabelContentView.addSubview(passwordLabel)
        loginContentView.addSubview(passwordContentView)
        passwordContentView.addSubview(passwordTextField)
        passwordContentView.addSubview(passwordHideButton)
        
        addSubview(buttonEnterContentView)
        buttonEnterContentView.addSubview(buttonEnter)
        emailContentView.addSubview(imageErrorEmailView)
        passwordContentView.addSubview(imageErrorPasswordView)
        
        addSubview(errorLabel)
    }
    
    private func setupisHidden(isHidden: Bool) {
        imageErrorEmailView.isHidden = isHidden
        imageErrorPasswordView.isHidden = isHidden
        errorLabel.isHidden = isHidden
    }
    
    private func setupTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        let tapReturn = UITapGestureRecognizer(target: self, action: #selector(textFieldShouldReturn))
        self.addGestureRecognizer(tapReturn)
    }
    
    @objc private func dismissKeyboard() {
        self.endEditing(true)
    }
    
    func loginError() {
        emailContentView.layer.borderColor = UIColor(named: "RedMedium")?.cgColor
        emailContentView.layer.borderWidth = 1
        emailContentView.backgroundColor = UIColor(named: "RedLight")
        emailTextField.backgroundColor = UIColor(named: "RedLight")
        passwordContentView.layer.borderColor = UIColor(named: "RedMedium")?.cgColor
        passwordContentView.layer.borderWidth = 1
        passwordContentView.backgroundColor = UIColor(named: "RedLight")
        passwordTextField.backgroundColor = UIColor(named: "RedLight")
        passwordHideButton.isHidden = true
        setupisHidden(isHidden: false)
    }
    
    private func setConstraints() {
        mainImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        buttonBack.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(40)
            make.width.equalTo(106)
        }
        
        logoContentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.height.equalTo(28)
            make.width.equalTo(153)
        }
        
        logotitleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        loginContentView.snp.makeConstraints { (make) in
            make.top.equalTo(logoContentView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(190)
            make.left.right.equalToSuperview()
        }
        
        emailLabelContentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(23)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(24)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        emailContentView.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabelContentView.snp_bottomMargin).offset(12)
            make.left.equalToSuperview().offset(23)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(52)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.height.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-25)
        }
        
        passwordLabelContentView.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp_bottomMargin).offset(24)
            make.left.equalToSuperview().offset(23)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(24)
        }
        
        passwordLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        passwordContentView.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabelContentView.snp_bottomMargin).offset(12)
            make.left.equalToSuperview().offset(23)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.height.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-52)
        }
        
        passwordHideButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(24)
            make.width.equalTo(26)
        }
        
        buttonEnterContentView.snp.makeConstraints { (make) in
            make.top.equalTo(loginContentView.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(327)
        }
        
        buttonEnter.snp.makeConstraints { (make) in
            make.centerY.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
        }
        
        imageErrorEmailView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        imageErrorPasswordView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        errorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(loginContentView.snp_bottomMargin)
            make.right.equalToSuperview().offset(-20)
        }
    }
}

extension LoginView: UITextFieldDelegate {
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    @objc private func emailChangeColorClickedTextField() {
        textFieldDidBeginEditing(emailTextField)
        buttonEnterClicked(sender: buttonEnter)
    }
    
    @objc private func passwordChangeColorClickedTextField() {
        textFieldDidBeginEditing(passwordTextField)
        buttonEnterClicked(sender: buttonEnter)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailContentView.layer.borderColor = UIColor(named: "White")?.cgColor
            emailContentView.backgroundColor = UIColor(named: "White")
            emailTextField.backgroundColor = UIColor(named: "White")
            imageErrorEmailView.isHidden = true
            errorLabel.isHidden = true
        } else if textField == passwordTextField {
            passwordContentView.layer.borderColor =  UIColor(named: "White")?.cgColor
            passwordContentView.backgroundColor = UIColor(named: "White")
            passwordTextField.backgroundColor = UIColor.init(named: "White")
            imageErrorPasswordView.isHidden = true
            passwordHideButton.isHidden = false
        }
    }
}


