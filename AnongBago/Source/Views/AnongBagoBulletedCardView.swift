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
        label.text = "Lorem ipsum dolor sit amet"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .darkGray
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
            
        }
    }

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
        
        iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
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
