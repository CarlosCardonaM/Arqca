//
//  RegistrationViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 01/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {
    
    
    private var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 50, weight: .regular)
        return label
    }()
    
    private var nameField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.secondarySystemBackground
        field.placeholder = "Name"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.autocapitalizationType = .words
        field.layer.cornerRadius = CGFloat(10.0)
        field.layer.masksToBounds = true
        return field
    }()
    
    private var lastNameField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.secondarySystemBackground
        field.placeholder = "Last Name"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.autocapitalizationType = .words
        field.layer.cornerRadius = CGFloat(10.0)
        field.layer.masksToBounds = true
        return field
    }()
    
    private var emailField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.secondarySystemBackground
        field.placeholder = "Email"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.cornerRadius = CGFloat(10.0)
        field.layer.masksToBounds = true
        return field
    }()
    
    private var passwordField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.secondarySystemBackground
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.cornerRadius = CGFloat(10)
        field.layer.masksToBounds = true
        return field
    }()
    
    private var confirmedPasswordField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.secondarySystemBackground
        field.placeholder = "Confirm your Password"
        field.isSecureTextEntry = true
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.cornerRadius = CGFloat(10)
        field.layer.masksToBounds = true
        return field
    }()
    
    private var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = CGFloat(10)
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Create an account"
        
        addSubviews()
        
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameField.becomeFirstResponder()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        labelTitle.frame =  CGRect(x: 35, y: 85, width: view.width / 2, height: 100)
        
        nameField.frame =  CGRect(x: 35, y: labelTitle.bottom + 80, width: view.width / 3.2, height: 52)
        
        lastNameField.frame =  CGRect(x: nameField.right + 10, y: labelTitle.bottom + 80, width: view.width / 2, height: 52)
        
        emailField.frame =  CGRect(x: 35, y: nameField.bottom + 10, width: view.width - 70, height: 52)
        
        passwordField.frame =  CGRect(x: 35, y: emailField.bottom + 10, width: view.width - 70, height: 52)
        
        confirmedPasswordField.frame =  CGRect(x: 35, y: passwordField.bottom + 10, width: view.width - 70, height: 52)
        
        registerButton.frame =  CGRect(x: 35, y: confirmedPasswordField.bottom + 80, width: view.width - 70, height: 52)
        
    }
    
    
    @objc private func didTapRegisterButton() {
        
        guard let name = nameField.text, !name.isEmpty, let lastName = lastNameField.text, !lastName.isEmpty ,let email = emailField.text, !email.isEmpty, email.contains("@"), email.contains(".com"), let password = passwordField.text, !password.isEmpty, password.count > 7, let confirmedPassword = confirmedPasswordField.text, !confirmedPassword.isEmpty, confirmedPassword == password else {
            configureRegisterAlert()
            return
        }
        
        AuthManager.shared.registerUser(email: email, password: password) { (Bool) in
            
            guard Bool == true else {
                print("IS FUCKING FAAALSE (Register User)")
                return
            }
            self.configureSuccesRegistrationAlert()
        }
        
    }
    
    private func configureRegisterAlert() {
        
        let alert = UIAlertController(title: "Fill the fields", message: "Please follow the fucking rules", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .destructive, handler: {_ in
            
            self.passwordField.text = ""
            self.confirmedPasswordField.text = ""
            self.passwordField.becomeFirstResponder()
        }))
        
        present(alert, animated: true)
    }
    
    private func configureSuccesRegistrationAlert() {
        
        let alert = UIAlertController(title: "Done!", message: "You`ve beeen registrated", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Log in", style: .default, handler: {_ in
            self.dismiss(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    private func addSubviews() {
        
        view.addSubview(labelTitle)
        view.addSubview(nameField)
        view.addSubview(lastNameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(confirmedPasswordField)
        view.addSubview(registerButton)
        
    }
    
}
