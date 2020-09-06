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
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Interiors"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 45, weight: .medium)
        return label
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
    
    private var habitacionButon: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CGFloat(20)
        return button
    }()
    
    private var mobilarioButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CGFloat(20)
        return button
    }()
    
    private var oficinaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CGFloat(20)
        return button
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
    
    private var diseñoEspaciosButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CGFloat(20)
        return button
    }()
    
    private var diseñoMobiliarioButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CGFloat(20)
        return button
    }()
    
    private var diseñoOficinaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CGFloat(20)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: view.width, height: view.heigth + 200)
        
        titleLabel.frame = CGRect(x: 10, y: 25, width: view.width - 20, height: 60)
        
        remodelacionLabel.frame = CGRect(x: 10, y: titleLabel.bottom + 30, width: view.width - 20, height: 50)
        
        remodecionBGView.frame = CGRect(x: 10, y: remodelacionLabel.bottom + 5, width: view.width - 20, height: 220)
        
        habitacionButon.frame = CGRect(x: 10, y: 10, width: remodecionBGView.width - 20, height: 60)
        
        mobilarioButton.frame = CGRect(x: 10, y: habitacionButon.bottom + 10, width: remodecionBGView.width - 20, height: 60)
        
        oficinaButton.frame = CGRect(x: 10, y: mobilarioButton.bottom + 10, width: remodecionBGView.width - 20, height: 60)
        
        diseñoLabel.frame = CGRect(x: 10, y: remodecionBGView.bottom + 20, width: view.width - 20, height: 50)
        
        diseñoBGView.frame = CGRect(x: 10, y: diseñoLabel.bottom + 5, width: view.width - 20, height: 220)
        
        diseñoEspaciosButton.frame = CGRect(x: 10, y: 10, width: diseñoBGView.width - 20, height: 60)
        
        diseñoMobiliarioButton.frame = CGRect(x: 10, y: diseñoEspaciosButton.bottom + 10, width: diseñoBGView.width - 20, height: 60)
        
        diseñoOficinaButton.frame = CGRect(x: 10, y: diseñoMobiliarioButton.bottom + 10, width: diseñoBGView.width - 20, height: 60)
    }
    
    
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(remodelacionLabel)
        scrollView.addSubview(remodecionBGView)
        remodecionBGView.addSubview(habitacionButon)
        remodecionBGView.addSubview(mobilarioButton)
        remodecionBGView.addSubview(oficinaButton)
        scrollView.addSubview(diseñoLabel)
        scrollView.addSubview(diseñoBGView)
        diseñoBGView.addSubview(diseñoEspaciosButton)
        diseñoBGView.addSubview(diseñoMobiliarioButton)
        diseñoBGView.addSubview(diseñoOficinaButton)
    }
    
    
}



