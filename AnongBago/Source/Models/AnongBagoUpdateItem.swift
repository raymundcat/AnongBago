//
//  Update.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 07/12/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import Foundation

public enum UpdateDescriptionType {
    case simple(title: String, description: String)
    case bulleted(title: String, descriptions:Array<String>)
}

public protocol AnongBagoUpdatable {
    var image: UIImage? { get }
    var descriptionType: UpdateDescriptionType { get }
}

public struct AnongBagoUpdateItem: AnongBagoUpdatable {
    
    public let image: UIImage?
    public let descriptionType: UpdateDescriptionType
    
    public init(descriptionType: UpdateDescriptionType, image: UIImage? = nil) {
        self.descriptionType = descriptionType
        self.image = image
    }
}
