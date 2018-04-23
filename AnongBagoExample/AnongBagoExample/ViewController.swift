//
//  ViewController.swift
//  AnongBagoExample
//
//  Created by John Raymund Catahay on 06/12/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import UIKit
import AnongBago

class ViewController: UIViewController {
    
    @IBAction func didPressLogin(_ sender: Any) {
        let manager = AnongBagoManager.shared
        manager.updates = [UpdateItem(title: "lmao", description: "lol", image: nil),
                           UpdateItem(title: "lmao", description: "lol", image: nil),
                           UpdateItem(title: "lmao", description: "lol", image: nil),
                           UpdateItem(title: "lmao", description: "lol", image: nil),
                           UpdateItem(title: "")]
        manager.showUpdates(forController: self)
    }
}
