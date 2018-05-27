//
//  AnongBagoBulletCardViewCell.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 27/05/2018.
//  Copyright © 2018 John Raymund Catahay. All rights reserved.
//

import UIKit

class AnongBagoBulletCell: UITableViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "• Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label;
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
