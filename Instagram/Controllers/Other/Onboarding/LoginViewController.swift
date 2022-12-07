//
//  LoginViewController.swift
//  Instagram
//
//  Created by kamilcal on 4.12.2022.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRectMake(0, 0, 10, 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    } ()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRectMake(0, 0, 10, 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    } ()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    } ()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    } ()
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
        
    } ()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    } ()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        
        createAccountButton.addTarget(self,
                                      action: #selector(didTapCreateAccountButton),
                                      for: .touchUpInside)
        
        termsButton.addTarget(self,
                              action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        
        privacyButton.addTarget(self,
                                action: #selector(didTapPrivacyButton),
                                for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRectMake(
            0,
            0.0,
            view.width,
            view.height/3.0)
        
        usernameEmailField.frame = CGRectMake(
            25,
            headerView.bottom + 10,
            view.width - 50,
            52)
        
        passwordField.frame = CGRectMake(
            25,
            usernameEmailField.bottom + 10,
            view.width - 50,
            52)
        
        loginButton.frame = CGRectMake(
            25,
            passwordField.bottom + 10,
            view.width - 50,
            52)
        
        createAccountButton.frame = CGRectMake(
            25,
            loginButton.bottom + 10,
            view.width - 50,
            52)
        
        termsButton.frame = CGRectMake(
            0,
            view.height - view.safeAreaInsets.bottom - 100,
            view.width - 20,
            50)
        
        privacyButton.frame = CGRectMake(
            0,
            view.height - view.safeAreaInsets.bottom - 50,
            view.width - 20,
            50)
        
        configureHeaderView()
        
        
    }
    //    ??
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        guard var backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        
        let imageView = UIImageView(image: UIImage(named: "headerText"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRectMake(headerView.width/4.0,
                                     view.safeAreaInsets.top,
                                     headerView.width/2.0,
                                     headerView.height - view.safeAreaInsets.top)
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
        
    }
    
    
    @objc private func didTapLoginButton() {
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = usernameEmailField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains("."){
            email = usernameEmail
        } else {
            username = usernameEmail
        }
        
        
        AuthManager.shared.loginUser(username: username,
                                     email: email,
                                     password: password){ succes in
            DispatchQueue.main.async {
                if succes {
                    self.dismiss(animated: true)
                } else {
                    let alert = UIAlertController(title: "Log In Error",
                                                  message: "We were unable to log you in.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel ))
                    self.present(alert, animated: true)
                }
            }
            
        }
        
    }
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/155833707900388") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc),animated: true)
//        present(vc, animated: true)
//        ?? arasındaki farka bak.
    }
    
    
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
}
