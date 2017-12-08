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
    
    lazy var anongBagoViewController: AnongBagoViewController = {
        let vc = AnongBagoViewController()
        vc.updates = [Update(title: "lmao", description: "lol"),
        Update(title: "lmao", description: "lol"),
        Update(title: "lmao", description: "lol"),
        Update(title: "lmao", description: "lol")]
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Example"
        
        self.navigationController?.present(anongBagoViewController, animated: true, completion: nil)
    }
}

