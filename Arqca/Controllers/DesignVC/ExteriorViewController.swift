//
//  ExteriorViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 04/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit

class ExteriorViewController: UIViewController {
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        title = "Fuck Yeah"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(didTapBackbutton))
    }
    
    @objc func didTapBackbutton() {
        self.dismiss(animated: true)
    }
    
}
