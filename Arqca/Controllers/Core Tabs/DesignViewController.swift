//
//  DesignViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 01/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit

class DesignViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor.systemBackground
        scroll.clipsToBounds = true
        return scroll
    }()
    
    private var interiorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = CGFloat(10)
        button.layer.masksToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "interior"))
        button.addSubview(backgroundImage)
        backgroundImage.clipsToBounds = true
        backgroundImage.contentMode = .scaleAspectFill
        return button
    }()
    
    private var exteriorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = CGFloat(10)
        button.layer.masksToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "exterior"))
        button.addSubview(backgroundImage)
        backgroundImage.clipsToBounds = true
        backgroundImage.contentMode = .scaleAspectFill
        return button
    }()
    
    private var interiorLabel: UILabel = {
        let label = UILabel()
        label.text = "Interiors"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    private var exteriorLabel: UILabel = {
        let label = UILabel()
        label.text = "Exteriors"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    private var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = CGFloat(20)
        return view
    }()
    
    private var designaLabel: UILabel = {
        let label = UILabel()
        label.text = "What are you looking for?"
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private var designTableview: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Design"
        addSubviews()
        
        interiorButton.addTarget(self, action: #selector(didTapInteriorButton), for: .touchUpInside)
        
        exteriorButton.addTarget(self, action: #selector(didTapExteriorButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: view.width, height: view.heigth - 145)
        
        backgroundView.frame = CGRect(x: 12, y: view.top + 20, width: view.width - 24, height: 510)
        
        designaLabel.frame = CGRect(x: 10, y: backgroundView.safeAreaInsets.top + 20, width: backgroundView.width - 20, height: 50)
        
        interiorButton.frame = CGRect(x: 10, y: designaLabel.bottom + 30, width: backgroundView.width - 20, height: 170)
        
        exteriorButton.frame = CGRect(x: 10, y: interiorButton.bottom + 50, width: backgroundView.width - 20, height: 170)
        
        interiorLabel.frame = CGRect(x: 10, y: interiorButton.heigth / 2, width: interiorButton.width - 20, height: 70)
        
        exteriorLabel.frame = CGRect(x: 10, y: exteriorButton.heigth / 2, width: exteriorButton.width - 20, height: 70)
        
        configureInteriorButton()
        configureExteriorButton()
        
       
        
    }
    
    
    private func configureInteriorButton() {
        guard interiorButton.subviews.count == 2 else {
            return
        }
        
        guard let  interiorBackground = interiorButton.subviews.first else {
            return
        }
        
        interiorBackground.frame = interiorButton.bounds
        
    }
    
    private func configureExteriorButton() {
        guard exteriorButton.subviews.count == 2 else {
            return
        }
        
        guard let  outsideBackground = exteriorButton.subviews.first else {
            return
        }
        
        outsideBackground.frame = exteriorButton.bounds
        
    }
    
    @objc private func didTapInteriorButton() {
        print("tapped too")
        let vc = InteriorViewController()
        let navVc = UINavigationController(rootViewController: vc)
        vc.title = "Interior"
        navVc.navigationBar.prefersLargeTitles = true
        navigationController?.pushViewController(vc, animated: true)
//        vc.modalPresentationStyle = .overCurrentContext
//        present(vc, animated: true)
    }
    
    @objc private func didTapExteriorButton() {
        print("tapped")
        let vc = ExteriorViewController()
        let navVc = UINavigationController(rootViewController: vc)
        vc.title = "Exterior"
        navVc.navigationBar.prefersLargeTitles = true
        navigationController?.pushViewController(vc, animated: true)
//        vc.modalPresentationStyle = .overCurrentContext
//        present(navVc, animated: true)
        
    }
    
    
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        interiorButton.addSubview(interiorLabel)
        exteriorButton.addSubview(exteriorLabel)
        backgroundView.addSubview(designaLabel)
        backgroundView.addSubview(interiorButton)
        backgroundView.addSubview(exteriorButton)
        
    }
}
