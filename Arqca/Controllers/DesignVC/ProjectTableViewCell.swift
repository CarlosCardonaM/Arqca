//
//  ProjectTableViewCell.swift
//  Arqca
//
//  Created by Carlos Cardona on 05/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    private var projectImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private var projectLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(projectImageView)
        addSubview(projectLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    
    

}
