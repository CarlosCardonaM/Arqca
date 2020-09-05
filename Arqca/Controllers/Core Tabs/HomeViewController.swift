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
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.darkGray
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = CGFloat(20)
        return tableView
    }()
    
    private var headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "gradinet"))
        backgroundImage.contentMode = .scaleAspectFill
        header.addSubview(backgroundImage)
        header.layer.cornerRadius = CGFloat(20)
        return header
    }()
    
   private var backgroundView: UIView = {
       let view = UIView()
       view.backgroundColor = .secondarySystemBackground
       view.clipsToBounds = true
       view.layer.cornerRadius = CGFloat(20)
       return view
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
        
        headerView.frame = CGRect(x: 10, y: scrollView.top, width: scrollView.width - 20, height: view.heigth / 4)
        
        configureHeaderView()
        
        backgroundView.frame = CGRect(x: 10, y: headerView.bottom + 30, width: view.width - 20, height: (scrollView.heigth * 2) - 250 )
        
        tableView.frame = CGRect(x: 10, y: view.top + 10, width: backgroundView.width - 20, height: backgroundView.heigth - 20)
        
        
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
        logoImage.frame = CGRect(x: headerView.width / 4.35, y: 15, width: headerView.width / 2, height: headerView.heigth - 25)
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
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(tableView)

    }
    
    
}
