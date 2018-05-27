//
//  CardView.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 22/04/2018.
//  Copyright © 2018 John Raymund Catahay. All rights reserved.
//

import UIKit

class AnongBagoSimpleCardView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .darkGray
        return label;
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        return label;
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView;
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
