//
//  AnongBagoManager.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 22/04/2018.
//  Copyright © 2018 John Raymund Catahay. All rights reserved.
//

import Foundation

open class AnongBagoManager: AnongBagoViewControllerDelegate {
    open static let shared = AnongBagoManager()
    
    open var updates: [Update] = [] {
        didSet {
            
        }
    }
    
    var presentingViewController: UIViewController?
    
    open func showUpdates(forController viewController: UIViewController,
                          completion: (() -> Void)? = nil){
        presentingViewController = viewController
        let anongBagoVC = AnongBagoViewController()
        anongBagoVC.updates = updates
        anongBagoVC.modalPresentationStyle = .overFullScreen
        anongBagoVC.modalTransitionStyle = .crossDissolve
        anongBagoVC.delegate = self
        viewController.present(anongBagoVC, animated: true, completion: nil)
    }
    
    public func didPressDone() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
