//
//  ProfileViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 01/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    
    private var signOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemRed
        
        button.setTitle("Log Out", for: .normal)
        button.layer.cornerRadius = CGFloat(10)
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        title = "Profile"
        addSubviews()
        
        signOutButton.addTarget(self, action: #selector(didTapSignOutButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        signOutButton.frame = CGRect(x: 30, y: view.heigth - view.safeAreaInsets.bottom - 100, width: view.width - 60, height: 52)
    }
    
    
    private func addSubviews() {
        view.addSubview(signOutButton)
        
    }
    
    @objc private func didTapSignOutButton() {
        signOutAlert()
        print("tapped")
        
    }
    
    private func signOutAlert() {
        
        
        let alert = UIAlertController(title: "Are you sure?", message: "Are you sure you wnat to log out", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {_ in
            
            do {
                try FirebaseAuth.Auth.auth().signOut()
                
                let vc = LoginViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                
                
            }
            catch {
                print("Fucking error ocurred")
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: {_ in
            alert.dismiss(animated: true)
        }))
        
        present(alert, animated: true)
    }
}
