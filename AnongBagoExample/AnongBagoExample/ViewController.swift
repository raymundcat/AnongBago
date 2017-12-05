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

    lazy var anongBagoViewController: AnongBagoViewController {
        let vc = AnongBagoViewController()
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

