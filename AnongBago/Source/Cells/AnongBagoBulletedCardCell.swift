//
//  AnongBagoBulletedCardCell.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 27/05/2018.
//  Copyright © 2018 John Raymund Catahay. All rights reserved.
//

import UIKit

class AnongBagoBulletedCardCell: UICollectionViewCell {
    
    lazy var cardView: AnongBagoBulletedCardView = {
        let view = AnongBagoBulletedCardView()
        return view
    }()
    
    var descriptions: [String] = [] {
        didSet {
            cardView.descriptions = descriptions
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
