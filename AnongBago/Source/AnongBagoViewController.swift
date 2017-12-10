//
//  AnongBagoViewController.swift
//  AnongBago
//
//  Created by John Raymund Catahay on 06/12/2017.
//  Copyright © 2017 John Raymund Catahay. All rights reserved.
//

import UIKit

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

public protocol AnongBagoViewControllerDelegate: class {
    func didPressDone()
}

open class AnongBagoViewController: UIViewController {
    
    lazy var blurEffect: UIBlurEffect = {
        return UIBlurEffect(style: .light)
    }()
    
    lazy var blurView: UIVisualEffectView = {
        return UIVisualEffectView(effect: blurEffect)
    }()
    
    static let reuseID = "cell"
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AnongBagoCollectionViewCell.self,
                                forCellWithReuseIdentifier: AnongBagoViewController.reuseID)
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    lazy var okButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DONE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    open var updates: [Update] = [] {
        didSet {
            
        }
    }
    
    weak var delegate: AnongBagoViewControllerDelegate?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        view.addSubview(blurView)
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(okButton)
        
        okButton.isHidden = true
        okButton.addTarget(self, action: #selector(didPressDone(sender:)), for: .touchDown)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        okButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor).isActive = true
    }
    
    @objc func didPressDone(sender: Any) {
        delegate?.didPressDone()
    }
}

extension AnongBagoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = updates.count
        return updates.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: AnongBagoViewController.reuseID,
                                                  for: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2 ) / pageWidth) + 1)
        pageControl.currentPage = page
        pageControl.isHidden = page + 1 == updates.count
        okButton.isHidden = page + 1 != updates.count
    }
}

class AnongBagoCollectionViewCell: UICollectionViewCell {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
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
