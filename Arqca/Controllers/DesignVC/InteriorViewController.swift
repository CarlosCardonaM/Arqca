//
//  InteriorViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 04/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit

class InteriorViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor.systemBackground
        scroll.clipsToBounds = true
        scroll.contentInsetAdjustmentBehavior = .never
        return scroll
    }()
    
    private var remodelacionLabel: UILabel = {
        let label = UILabel()
        label.text = "Remodelacion:"
        label.textColor = UIColor.secondaryLabel
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private var remodecionBGView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = CGFloat(20)
        return view
    }()
    
    private var diseñoLabel: UILabel = {
        let label = UILabel()
        label.text = "Diseño:"
        label.textColor = UIColor.secondaryLabel
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private var diseñoBGView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = CGFloat(20)
        return view
    }()
    
    private var remodelacionTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.systemBackground
        tableView.layer.cornerRadius = CGFloat(20)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "remodelacionCell")
        return tableView
    }()
    
    private var diseñoTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.tertiarySystemBackground
        tableView.layer.cornerRadius = CGFloat(20)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "diseñoCell")
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        addSubviews()
        diseñoTableView.delegate = self
        remodelacionTableView.delegate = self
        diseñoTableView.dataSource = self
        remodelacionTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: view.width, height: view.heigth + 200)
        
        remodelacionLabel.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 10, width: view.width - 20, height: 50)
        
        remodecionBGView.frame = CGRect(x: 10, y: remodelacionLabel.bottom + 5, width: view.width - 20, height: 220)
        
        remodelacionTableView.frame = CGRect(x: 10, y: 10, width: remodecionBGView.width - 20, height: remodecionBGView.heigth - 20)
        
        diseñoLabel.frame = CGRect(x: 10, y: remodecionBGView.bottom + 20, width: view.width - 20, height: 50)
        
        diseñoBGView.frame = CGRect(x: 10, y: diseñoLabel.bottom + 5, width: view.width - 20, height: 220)
        
        diseñoTableView.frame = CGRect(x: 10, y: 10, width: diseñoBGView.width - 20, height: diseñoBGView.heigth - 20)
        
    }
    
    
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(remodelacionLabel)
        scrollView.addSubview(remodecionBGView)
        remodecionBGView.addSubview(remodelacionTableView)
        scrollView.addSubview(diseñoLabel)
        scrollView.addSubview(diseñoBGView)
        diseñoBGView.addSubview(diseñoTableView)
    }
    
    
}


extension InteriorViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == remodelacionTableView, let cell = tableView.dequeueReusableCell(withIdentifier: "cell"){
            return cell
        }
        else if tableView == diseñoTableView, let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") {
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        diseñoTableView.deselectRow(at: indexPath, animated: true)
        remodelacionTableView.deselectRow(at: indexPath, animated: true)
        
        let vc = UIViewController()
        present(vc, animated: true)
    }
    
    
}
