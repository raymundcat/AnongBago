//
//  Update.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 07/12/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import Foundation

public struct Update {
    
    public let title: String?
    public let image: UIImage?
    public let description: String?
    
    public init(title: String?, description: String?, image: UIImage?) {
        self.title = title
        self.description = description
        self.image = image
    }
}
