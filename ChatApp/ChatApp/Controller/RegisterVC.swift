//
//  RegisterVC.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 5.01.2023.
//

import UIKit

class RegisterVC: UIViewController {
    
    private var viewModel = RegisterVM()
    
    private lazy var addCameraButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(named: "icons8-compact-camera-72()"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handlePhoto), for: .touchUpInside)
        return button
        
    }()
    
    private let emailTextField = CustomTextField(plecholder: "Email")
    private let nameTextField = CustomTextField(plecholder: "Name")
    private let usernameTextField = CustomTextField(plecholder: "Username")
    private let passwordTextField: CustomTextField = {
       
        let textField = CustomTextField(plecholder: "Password")
        textField.isSecureTextEntry = true
        
        return textField
        
    }()
    
    
    
    
    private lazy var emailContainerView: AuthenticationInputView = {
       
        let containrView = AuthenticationInputView(image: UIImage(named: "icons8-mail-300()")!, textField: emailTextField)
        
        return containrView
        
    }()
   
    private lazy var nameContainerView: AuthenticationInputView = {
       
        let containrView = AuthenticationInputView(image: UIImage(named: "icons8-user-72()")!, textField: nameTextField)
        
        return containrView
        
    }()
   
    private lazy var usernameContainerView: AuthenticationInputView = {
       
        let containrView = AuthenticationInputView(image: UIImage(named: "icons8-user-72()")!, textField: usernameTextField)
        
        return containrView
        
    }()
    
    private lazy var passwordContainerView: AuthenticationInputView = {
       
        let containrView = AuthenticationInputView(image: UIImage(named: "icons8-lock-300()")!, textField: passwordTextField)
        
        return containrView
        
    }()

    
    private var stackView = UIStackView()
    private let registerButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.isEnabled = false
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        return button
        
        
    }()
    
    private lazy var switchToLoginPage:UIButton = {
       
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "If you are a member, Login Page", attributes:[.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleGoToLoginVC), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
       
    }
    


}

extension RegisterVC {
    
    @objc private func handleTextFieldChange(_ sender: UITextField ) {
        
        if sender == emailTextField {
            viewModel.email = sender.text
        }else if sender == nameTextField {
            viewModel.name = sender.text
           
        }else if sender == usernameTextField {
            viewModel.usernama = sender.text
        
        }else {
            viewModel.password = sender.text
        }
        registeruButtonStatus()
    }
    
    @objc private func handleGoToLoginVC(_ sender: UIButton) {
        
     
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func handlePhoto(_ sender: UIButton) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker, animated: true)
    }
     
    
}



extension  RegisterVC {
    
    
    
        
        private func registeruButtonStatus() {
            
            if viewModel.status {
                registerButton.isEnabled = true
                registerButton.backgroundColor = .systemCyan
            }else {
                registerButton.isEnabled = false
                registerButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            }
        }
    
    private func style(){
        
        configureGradientLayer()
        self.navigationController?.navigationBar.isHidden = true
        
        addCameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView = UIStackView(arrangedSubviews: [emailContainerView,usernameContainerView,nameContainerView, passwordContainerView, registerButton ])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)
        
        
        switchToLoginPage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        
        view.addSubview(addCameraButton)
        view.addSubview(stackView)
        view.addSubview(switchToLoginPage)
        NSLayoutConstraint.activate([
        
            addCameraButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            addCameraButton.heightAnchor.constraint(equalToConstant: 150),
            addCameraButton.widthAnchor.constraint(equalToConstant: 150),
            addCameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: addCameraButton.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            
            switchToLoginPage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            switchToLoginPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: switchToLoginPage.trailingAnchor, constant: 32)
            
        ])
        
        
    }
}


extension RegisterVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        addCameraButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        addCameraButton.layer.cornerRadius = 150 / 2
        addCameraButton.clipsToBounds = true
        addCameraButton.layer.borderColor = UIColor.white.cgColor
        addCameraButton.layer.borderWidth = 2
        addCameraButton.contentMode = .scaleAspectFill
        
        dismiss(animated: true)
    }
    
}
