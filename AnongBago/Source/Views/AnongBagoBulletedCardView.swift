//
//  AnongBagoBulletedCardView.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 27/05/2018.
//  Copyright © 2018 John Raymund Catahay. All rights reserved.
//

import UIKit

class AnongBagoBulletedCardView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 22)
        return label;
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView;
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.register(AnongBagoBulletCell.self,
                           forCellReuseIdentifier: String(describing: AnongBagoBulletCell.self))
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var descriptions: [String] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    var iconHeightAnchorConstraint: NSLayoutConstraint?
    var icon0HeightAnchorConstraint: NSLayoutConstraint?

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
        addSubview(tableView)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        icon0HeightAnchorConstraint = iconImageView.heightAnchor.constraint(equalToConstant: 0)
        icon0HeightAnchorConstraint?.isActive = true
        icon0HeightAnchorConstraint?.priority = .defaultLow
        iconHeightAnchorConstraint = iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor)
        iconHeightAnchorConstraint?.isActive = true
        iconHeightAnchorConstraint?.priority = .defaultHigh
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnongBagoBulletedCardView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: AnongBagoBulletCell.self), for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension AnongBagoBulletedCardView: UITableViewDelegate {
    
}
