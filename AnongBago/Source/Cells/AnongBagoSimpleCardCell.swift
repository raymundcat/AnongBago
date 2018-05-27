//
//  AnongBagoCollectionViewCell.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 22/04/2018.
//  Copyright © 2018 John Raymund Catahay. All rights reserved.
//

import UIKit

/* Simple Card Cell for presenting simple updates with description*/
class AnongBagoSimpleCardCell: UICollectionViewCell {
    
    lazy var cardView: AnongBagoSimpleCardView = {
        let view = AnongBagoSimpleCardView()
        return view
    }()
    
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
