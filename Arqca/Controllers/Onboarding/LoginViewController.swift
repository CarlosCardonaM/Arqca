//
//  LoginViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 01/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        
        static let cornerRadius: CGFloat = 10.0
    }
    
    private var EmailUsernameField: UITextField = {
        var field = UITextField()
        field.backgroundColor = UIColor.secondarySystemBackground
        field.placeholder = "Email or Username"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.masksToBounds = true
        return field
    }()
    
    private var passwordField: UITextField = {
        var field = UITextField()
        field.backgroundColor = UIColor.secondarySystemBackground
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.masksToBounds = true
        return field
    }()
    
    private var loginButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private var createAnAccount: UIButton = {
        var button = UIButton()
        button.setTitle("New Here? Create an Account!", for: .normal)
        button.setTitleColor(UIColor.secondaryLabel, for: .normal)
        return button
    }()
    
    private var termsButton: UIButton = {
        var button = UIButton()
        button.setTitle("Terms of use", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private var privacyButton: UIButton = {
        var button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private var headerView: UIView = {
        var header  = UIView()
        header.clipsToBounds = true
        header.backgroundColor = UIColor.systemBackground
        return header
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = UINavigationController(rootViewController: self)
        
        
        addSubviews()
        view.backgroundColor = .systemBackground
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAnAccount.addTarget(self, action: #selector(didTapCreateNewAccountButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        EmailUsernameField.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.heigth / 3)
        
        EmailUsernameField.frame = CGRect(x: 25.0, y: headerView.bottom + 40, width: view.frame.width - 50, height: 52.0)
        
        passwordField.frame = CGRect(x: 25.0, y: EmailUsernameField.bottom + 10, width: view.width - 50, height: 52.0)
        
        loginButton.frame = CGRect(x: 25.0, y: passwordField.bottom + 15, width: view.width - 50, height: 52.0)
        
        createAnAccount.frame = CGRect(x: 25.0, y: loginButton.bottom + 13, width: view.width - 50, height: 52.0)
        
        termsButton.frame = CGRect(x: 20.0,
                                   y: view.heigth - view.safeAreaInsets.bottom - 100,
                                   width: view.width - 40,
                                   height: 52.0)
        
        privacyButton.frame = CGRect(x: 20.0,
                                   y: view.heigth - view.safeAreaInsets.bottom - 50,
                                   width: view.width - 40,
                                   height: 52.0)
        
        configureHeaderview()
        
    }
    
    private func configureHeaderview() {
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width / 4, y: view.safeAreaInsets.top, width: headerView.width / 2.0, height: headerView.heigth - view.safeAreaInsets.top)
    }
    
    @objc private func didTapLoginButton() {
        
        guard let email = EmailUsernameField.text, !email.isEmpty, email.contains("@"), email.contains(".com"), let password = passwordField.text, !password.isEmpty, password.count > 7 else {
            print("Fuck!! Just Follow the rules to LOG IN")
            self.configureLoginALert()
            return
        }
        
        AuthManager.shared.loginUser(email: email, password: password) { (Bool) in
            
            guard Bool == true else {
                print(Bool)
                print("IS FUCKING FALSE (login user)")
                self.newHereAlert()
                return
            }
            print("We accessed succesfully! (Login)")
            self.dismiss(animated: true)
        }
        
        
    }
    
    @objc private func didTapCreateNewAccountButton() {
        
        let vc = RegistrationViewController()
        let navVc = UINavigationController(rootViewController: vc)
        navVc.navigationBar.prefersLargeTitles = true
        present(navVc, animated: true)
        print("someone tapped me")
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://www.homify.com.mx/profesionales/1863964/arqca") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
        
    }
    
    @objc private func didTapPrivacyButton() {
        
        guard let url = URL(string: "https://www.homify.com.mx/profesionales/1863964/arqca") else {
            print("Esa no es la url carnal")
            return
        }
        
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
        
    }
    
    private func newHereAlert() {
        
        let alert = UIAlertController(title: "New here?", message: "Do you wnat to create an account!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Sure!", style: .default, handler: {_ in
            
            self.EmailUsernameField.text = ""
            self.passwordField.text = ""
            
            self.didTapCreateNewAccountButton()
        }))
        alert.addAction(UIAlertAction(title: "No, thanks!", style: .destructive, handler: {_ in
            
            self.EmailUsernameField.text = ""
            self.passwordField.text = ""
            alert.dismiss(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    private func configureLoginALert() {
        
        let alert = UIAlertController(title: "Fill the fields", message: "Please follow the rules.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Try again", style: .destructive, handler: { _ in
            
             self.passwordField.text = ""
        }))
    }
    
    
    private func addSubviews() {
        view.addSubview(EmailUsernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAnAccount)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
        
    }
    
    
}
