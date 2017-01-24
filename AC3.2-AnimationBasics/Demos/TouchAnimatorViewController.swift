//
//  TouchAnimatorViewController.swift
//  AC3.2-AnimationBasics
//
//  Created by Louis Tur on 1/23/17.
//  Copyright © 2017 Access Code. All rights reserved.
//

import UIKit
import SnapKit

class TouchAnimatorViewController: UIViewController {
    
    var animator: UIViewPropertyAnimator? = nil
    let squareSize = CGSize(width: 100.0, height: 100.0)
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        configureConstraints()
    }
    
    
    // MARK: - Setup
    private func configureConstraints() {
        darkBlueView.snp.makeConstraints{ view in
            view.center.equalToSuperview()
            view.size.equalTo(squareSize)
        }
    }
    
    private func setupViewHierarchy() {
        self.view.backgroundColor = .white
        self.view.isUserInteractionEnabled = true
        
        view.addSubview(darkBlueView)
    }
    
    
    // MARK: - Movement
    internal func move(view: UIView, to point: CGPoint) {
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.6) {
            self.view.layoutIfNeeded()
        }
        
        view.snp.remakeConstraints { (view) in
            view.center.equalTo(point)
            view.size.equalTo(squareSize)
        }
        
        animator.addAnimations ({
            view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, delayFactor: 0.15)
        
        animator.addAnimations ({
            view.transform = CGAffineTransform.identity
        }, delayFactor: 0.85)
        
        animator.startAnimation()
    }
    
    internal func pickUp(view: UIView) {
        self.animator = UIViewPropertyAnimator(duration: 20.0, dampingRatio: 0.6) {
            self.view.layoutIfNeeded()
        }
        
        view.snp.remakeConstraints { (view) in
            view.size.equalTo(CGSize(width: 200.0, height: 200.0))
        }
        
        animator?.addAnimations {
            view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        
        animator?.startAnimation()
    }
    
    
    // MARK: - Tracking Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            print("No touching")
            return
        }
        
        let touchLocationInView = touch.location(in: view)
        print("Touch at: \(touchLocationInView)")
        
        if darkBlueView.bounds.contains(touchLocationInView) {
            pickUp(view: darkBlueView)
        }
        
        move(view: darkBlueView, to: touchLocationInView)
    }
    
    // MARK: - Views
    internal lazy var darkBlueView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.darkBlue
        return view
    }()
}
