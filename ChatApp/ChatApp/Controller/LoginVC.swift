//
//  LoginVC.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 2.01.2023.
//

import UIKit

class LoginVC: UIViewController {
    
    private  var viewModel = LoginViewModel()
    private let logoImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "icon")
        imageView.tintColor = .red
        return imageView
        
    }()
    
    private lazy var emailContainerView: AuthenticationInputView = {
       
        let containrView = AuthenticationInputView(image: UIImage(named: "icons8-mail-300()")!, textField: emailTextField)
        
        return containrView
        
    }()
    
    private let emailTextField = CustomTextField(plecholder: "Email")
    
    
    
    
    private lazy var passwordContainerView: AuthenticationInputView = {
       
        let containrView = AuthenticationInputView(image: UIImage(named: "icons8-lock-300()")!, textField: passwordTextField)
        
        return containrView
        
    }()
    
    private let passwordTextField: CustomTextField = {
       
        let textField = CustomTextField(plecholder: "Password")
        textField.isSecureTextEntry = true
        
        return textField
        
    }()
      
    private var stackView = UIStackView()
    private let loginButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.isEnabled = false
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        return button
        
        
    }()
    
    private lazy var switchRegistrationPage:UIButton = {
       
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Click To Become A Member", attributes:[.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleGoToRegissterVC), for: .touchUpInside)
        
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
        configureGradientLayer()
        style()
        layout()
        
    }
    

    

}

extension LoginVC {
    
    @objc private func handleTextFieldChange(_ sender: UITextField ) {
        
        if sender == emailTextField {
            viewModel.emailTextField = sender.text
        }else {
            viewModel.passwordTextField = sender.text
        }
        loginButtonStatus()
    }
    
    @objc private func handleGoToRegissterVC(_ sender: UIButton) {
        
        let controller = RegisterVC()
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}





extension LoginVC {
    
    private func loginButtonStatus() {
        
        if viewModel.status {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemCyan
        }else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
    }
    
    
    private func style() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        emailContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton ])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)
        
        
        switchRegistrationPage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        view.addSubview(switchRegistrationPage)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            switchRegistrationPage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            switchRegistrationPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: switchRegistrationPage.trailingAnchor, constant: 32)
            
        
         ])
    }
}
