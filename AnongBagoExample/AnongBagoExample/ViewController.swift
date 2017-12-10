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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Example"
    }
    
    @IBAction func didPressLogin(_ sender: Any) {
        let manager = AnongBagoManager.shared
        manager.updates = [Update(title: "lmao", description: "lol"),
                           Update(title: "lmao", description: "lol"),
                           Update(title: "lmao", description: "lol"),
                           Update(title: "lmao", description: "lol")]
        manager.showUpdates(forController: self)
    }
}

