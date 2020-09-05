//
//  HomeViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 01/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor.systemBackground
        scroll.clipsToBounds = true
        return scroll
    }()
    
    private var headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "gradinet"))
        backgroundImage.contentMode = .scaleAspectFill
        header.addSubview(backgroundImage)
        
        return header
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        title = "Home"
        scrollView.frame = view.bounds
        addSubviewsToScrollView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: view.width, height: view.heigth * 2)
        
        headerView.frame = CGRect(x: 0.0, y: scrollView.top, width: scrollView.right, height: view.heigth / 4)
        
        configureHeaderView()
        
        
    }
    
    private func configureHeaderView() {
        
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundHeader = headerView.subviews.first else {
            return
        }
        
        backgroundHeader.frame = headerView.bounds
        
//        Add Arqca Logo
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        headerView.addSubview(logoImage)
        logoImage.frame = CGRect(x: headerView.width / 4.35, y: 15, width: headerView.width / 2, height: headerView.heigth - 15)
    }
    
    private func handleNotAuthenticated() {
        
        if Auth.auth().currentUser == nil {
            //            Show Log In VC
            let LoginVc = LoginViewController()
            LoginVc.modalPresentationStyle = .fullScreen
            present(LoginVc, animated: true)
        }
        else {
            return
        }
        
    }
    
    
    private func addSubviewsToScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(headerView)

    }
    
    
}
