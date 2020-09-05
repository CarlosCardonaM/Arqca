//
//  GuerreroViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 05/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit

class GuerreroViewController: UIViewController {
    
    private var gallery1ImageView: UIImageView = {
        let imageView = UIImageView()
        let background = UIImageView(image: UIImage(named: "gallery 1"))
        imageView.addSubview(background)
        background.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = CGFloat(10)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var gallery2ImageView: UIImageView = {
        let imageView = UIImageView()
        let background = UIImageView(image: UIImage(named: "gallery 2"))
        imageView.addSubview(background)
        background.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = CGFloat(10)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var gallery3ImageView: UIImageView = {
        let imageView = UIImageView()
        let background = UIImageView(image: UIImage(named: "gallery 3"))
        imageView.addSubview(background)
        background.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = CGFloat(10)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var gallery4ImageView: UIImageView = {
        let imageView = UIImageView()
        let background = UIImageView(image: UIImage(named: "gallery 4"))
        imageView.addSubview(background)
        background.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = CGFloat(10)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor.systemBackground
        scroll.clipsToBounds = true
        scroll.contentInsetAdjustmentBehavior = .never
        return scroll
    }()
    
    private var descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = CGFloat(20)
        return view
    }()
    
    private var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = CGFloat(20)
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Gallery"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 45, weight: .medium)
        return label
    }()
    
    private var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description:"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Se realizaron trabajos de renovación de piso, plafones y
        acabados en muros en áreas de sala, comedor, recamara
        principal con baño y baño de visítas.
        
        Se emplearón materiales naturales en piedra y madera en la
        recámara, como remate visual se construyó un muro flotado
        de piera natural suspendido por una placa de Ónix, en el
        baño se diseñó mueble lavamanos como parte central del
        diseño,utilizando nuevamente la piedra Ónix para permitir
        la salida de luz.
        
        El vestidor se integra en conjunto con el área de lavamanos
        y el baño cuenta con regadera y tina de hidromasaje.
        el uso de luz indirecta es parte del diseño en general.
        
        El area de sala-comedor se renovo considerando la chimenea
        como eje rector y punto focal del diseño, nuevamente el uso
        de materiales naturales adornan el espacio asi como el uso
        de luz indirecta en plafones.
        
        El baño de visitas es pequeño pero con un diseño moderno
        y atractivo, el juego de luces en muros y plafones dan
        vida a este pequeño espacio.
        """
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private var galerryLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gerrero Gallery"
        view.backgroundColor =  UIColor.systemBackground
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        titleLabel.frame = CGRect(x: 10, y: 25, width: view.width - 20, height: 60)
        scrollView.frame =  CGRect(x: 0, y: titleLabel.bottom + 20, width: view.right, height: view.heigth)
        scrollView.contentSize = CGSize(width: view.width, height: 1500)
        descriptionView.frame = CGRect(x: 10, y: 10, width: view.width - 10, height: 450)
        backgroundView.frame = CGRect(x: 10, y: descriptionView.bottom + 20, width: view.width - 20, height: 870)
        descriptionTitleLabel.frame = CGRect(x: 10, y: 10, width: view.width - 20, height: 50)
        descriptionLabel.frame = CGRect(x: 10, y: descriptionTitleLabel.bottom + 10, width: view.width - 20, height: 360)
        gallery1ImageView.frame = CGRect(x: 10, y: 10, width: backgroundView.width - 20, height: 200)
        gallery2ImageView.frame = CGRect(x: 10, y: gallery1ImageView.bottom + 20, width: backgroundView.width - 20, height: 200)
        gallery3ImageView.frame = CGRect(x: 10, y: gallery2ImageView.bottom + 10, width: backgroundView.width - 20, height: 200)
        gallery4ImageView.frame = CGRect(x: 10, y: gallery3ImageView.bottom + 10, width: backgroundView.width - 20, height: 200)
        cofigureFirstImage()
        configureSecondImage()
        configureThirdImage()
        configureFourthImage()
    }
    
    private func addSubviews() {
        
        backgroundView.addSubview(gallery4ImageView)
        backgroundView.addSubview(gallery3ImageView)
        backgroundView.addSubview(gallery2ImageView)
        backgroundView.addSubview(gallery1ImageView)
        descriptionView.addSubview(descriptionTitleLabel)
        descriptionView.addSubview(descriptionLabel)
        scrollView.addSubview(backgroundView)
        scrollView.addSubview(descriptionView)
        view.addSubview(scrollView)
        view.addSubview(titleLabel)
    }
    
    private func cofigureFirstImage() {
        
        guard gallery1ImageView.subviews.count == 1 else {
            return
        }
        
        guard let background = gallery1ImageView.subviews.first else {
            return
        }
        
        background.frame = gallery1ImageView.bounds
    }
    
    private func configureSecondImage() {
        
        guard gallery2ImageView.subviews.count == 1 else {
            return
        }
        
        guard let background = gallery2ImageView.subviews.first else {
            return
        }
        
        background.frame = gallery2ImageView.bounds
    }
    
    private func configureThirdImage() {
        
        guard gallery3ImageView.subviews.count == 1 else {
            return
        }
        
        guard let background = gallery3ImageView.subviews.first else {
            return
        }
        
        background.frame = gallery3ImageView.bounds
    }
    
    private func configureFourthImage() {
        
        guard gallery4ImageView.subviews.count == 1 else {
            return
        }
        
        guard let background = gallery4ImageView.subviews.first else {
            return
        }
        
        background.frame = gallery4ImageView.bounds
    }
}
