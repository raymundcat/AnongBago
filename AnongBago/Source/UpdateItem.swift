//
//  Update.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 07/12/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import Foundation

public struct UpdateItem {
    
    public let title: String?
    public let image: UIImage?
    public let description: String?
    
    public init(title: String? = nil, description: String? = nil, image: UIImage? = nil) {
        self.title = title
        self.description = description
        self.image = image
    }
}
