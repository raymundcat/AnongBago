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
        manager.updates = [AnongBagoUpdateItem(descriptionType: .bulleted(title: "", descriptions: ["bullet", "lol", "lmao"])),
            AnongBagoUpdateItem(descriptionType: .simple(title: "", description: "")),
            AnongBagoUpdateItem(descriptionType: .simple(title: "", description: ""))]
        manager.showUpdates(forController: self)
    }
}
