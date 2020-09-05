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
    
    private var projectGuerreroButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = CGFloat(10)
        button.layer.masksToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "gerrero portada"))
        button.addSubview(backgroundImage)
        backgroundImage.clipsToBounds = true
        backgroundImage.contentMode = .scaleAspectFill
        return button
    }()
    
    private var projectGuerreroLabel: UILabel = {
        let label = UILabel()
        label.text = "Residencia Guerrero"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.masksToBounds = false
        label.layer.shadowOffset = CGSize(width: 2 , height: 2)
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 10
        
        return label
    }()
    
    private var remodelacionBelenButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = CGFloat(10)
        button.layer.masksToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "remodelacion belen"))
        button.addSubview(backgroundImage)
        backgroundImage.clipsToBounds = true
        backgroundImage.contentMode = .scaleAspectFill
        return button
    }()
    
    private var remodelacionBelenLabel: UILabel = {
        let label = UILabel()
        label.text = "Remodelación Beélen"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.masksToBounds = false
        label.layer.shadowOffset = CGSize(width: 2 , height: 2)
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 10
        
        return label
    }()
    
    private var roofgardenMartinezButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = CGFloat(10)
        button.layer.masksToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "roof garden martinez"))
        button.addSubview(backgroundImage)
        backgroundImage.clipsToBounds = true
        backgroundImage.contentMode = .scaleAspectFill
        return button
    }()
    
    private var roofGardenMartinezLabel: UILabel = {
        let label = UILabel()
        label.text = "Roof Garden Martínez"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.masksToBounds = false
        label.layer.shadowOffset = CGSize(width: 2 , height: 2)
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 10
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        title = "Home"
        scrollView.frame = view.bounds
        addSubviewsToScrollView()
        
        projectGuerreroButton.addTarget(self, action: #selector(didTapGuerreroButton), for: .touchUpInside)
        
        remodelacionBelenButton.addTarget(self, action: #selector(didTapRemodelacionBelenButton), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: view.width, height: 830)
        
        headerView.frame = CGRect(x: 10, y: scrollView.top, width: scrollView.width - 20, height: view.heigth / 4)
        
        configureHeaderView()
        
        backgroundView.frame = CGRect(x: 10, y: headerView.bottom + 30, width: view.width - 20, height: 570 )
        
        projectGuerreroButton.frame = CGRect(x: 10, y: view.top + 15, width: backgroundView.width - 20, height: 170)
        
        projectGuerreroLabel.frame = CGRect(x: 10, y: projectGuerreroButton.heigth / 2, width: projectGuerreroButton.width - 20, height: 70)
        
        remodelacionBelenButton.frame = CGRect(x: 10, y: projectGuerreroButton.bottom + 15, width: backgroundView.width - 20, height: 170)
        
        remodelacionBelenLabel.frame = CGRect(x: 10, y: remodelacionBelenButton.heigth / 2, width: remodelacionBelenButton.width - 20, height: 70)
        
        roofgardenMartinezButton.frame = CGRect(x: 10, y: remodelacionBelenButton.bottom + 15, width: backgroundView.width - 20, height: 170)
        
        roofGardenMartinezLabel.frame = CGRect(x: 10, y: roofgardenMartinezButton.heigth / 2, width: roofgardenMartinezButton.width - 20, height: 70)
        
        configureProjectGuerrero()
        configureRemodelacionBelenButton()
        configureRoofGardenMartinezButton()
        
    }
    
    private func configureRoofGardenMartinezButton() {
        
        guard roofgardenMartinezButton.subviews.count == 2 else {
            print(roofgardenMartinezButton.subviews.count)
            return
        }
        
        guard let roofGardenBackground = roofgardenMartinezButton.subviews.first else {
            return
        }
        
        roofGardenBackground.frame = remodelacionBelenButton.bounds
    }
    
    private func configureRemodelacionBelenButton() {
        
        guard remodelacionBelenButton.subviews.count == 2 else {
            print(remodelacionBelenButton.subviews.count)
            return
        }
        
        guard let remodelacionBelenBackground = remodelacionBelenButton.subviews.first else {
            return
        }
        
        remodelacionBelenBackground.frame = remodelacionBelenButton.bounds
    }
    
    private func configureProjectGuerrero() {
        
        guard projectGuerreroButton.subviews.count == 2 else {
            print(projectGuerreroButton.subviews.count)
            return
        }
        
        guard let guerreroBackground = projectGuerreroButton.subviews.first else {
            return
        }
        
        guerreroBackground.frame = projectGuerreroButton.bounds
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
    
    @objc func didTapRemodelacionBelenButton() {
        let vc = remodelacionBelenViewController()
        present(vc, animated: true)
    }
    
    
    @objc func didTapGuerreroButton() {
        let vc = GuerreroViewController()
        present(vc, animated: true)
    }
    
    
    private func addSubviewsToScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(headerView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(projectGuerreroButton)
        projectGuerreroButton.addSubview(projectGuerreroLabel)
        backgroundView.addSubview(remodelacionBelenButton)
        remodelacionBelenButton.addSubview(remodelacionBelenLabel)
        backgroundView.addSubview(roofgardenMartinezButton)
        roofgardenMartinezButton.addSubview(roofGardenMartinezLabel)

    }
    
    
}

