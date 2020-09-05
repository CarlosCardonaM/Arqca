//
//  TestViewController.swift
//  Arqca
//
//  Created by Carlos Cardona on 04/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit

class TestViewController: UINavigationController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Title Here"
        view.backgroundColor =  UIColor.systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
