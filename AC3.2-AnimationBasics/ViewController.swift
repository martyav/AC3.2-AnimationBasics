//
//  ViewController.swift
//  AC3.2-AnimationBasics
//
//  Created by Louis Tur on 1/22/17.
//  Copyright © 2017 Access Code. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    static let animationDuration: TimeInterval = 2.0
    static let squareSize = CGSize(width: 100.0, height: 100.0)
    
    let blueAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .linear, animations: nil)
    let greenAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeIn, animations: nil)
    let yellowAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut, animations: nil)
    let orangeAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeOut, animations: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        configureConstraints()
        
        addGesturesAndActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    private func configureConstraints() {
        let _ = [darkBlueView, greenView, yellowView, orangeView].map { $0.snp.removeConstraints() }
        
        // blue
        darkBlueView.snp.makeConstraints { (view) in
            view.leading.equalToSuperview().offset(20.0)
            view.top.equalToSuperview().offset(20.0)
            view.size.equalTo(ViewController.squareSize)
        }
        
        // green
        
        greenView.snp.makeConstraints { (view) in
            view.leading.equalToSuperview().offset(20.0)
            view.top.equalTo(darkBlueView.snp.bottom).offset(20.0)
            view.size.equalTo(ViewController.squareSize)
        }
        
        // yellow
        
        yellowView.snp.makeConstraints { (view) in
            view.leading.equalToSuperview().offset(20.0)
            view.top.equalTo(greenView.snp.bottom).offset(20.0)
            view.size.equalTo(ViewController.squareSize)
        }
        
        // orange
        
        orangeView.snp.makeConstraints { (view) in
            view.leading.equalToSuperview().offset(20.0)
            view.top.equalTo(yellowView.snp.bottom).offset(20.0)
            view.size.equalTo(ViewController.squareSize)
        }
        
        // button
        animateButton.snp.makeConstraints { (view) in
            view.centerX.equalToSuperview()
            view.bottom.equalToSuperview().inset(50.0)
            view.width.greaterThanOrEqualTo(100.0)
        }
        
    }
    
    private func setupViewHierarchy() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(darkBlueView)
        self.view.addSubview(yellowView)
        self.view.addSubview(greenView)
        self.view.addSubview(orangeView)
        self.view.addSubview(animateButton)
    }
    
    
    
    private func addGesturesAndActions() {
        self.animateButton.addTarget(self, action: #selector(animateViews), for: .touchUpInside)
    }
    
    
    // MARK: - Animations
    
    // MARK: Property Animator
    internal func animateViews() {
        if !animateButton.isSelected {
            animateBlueViewWithAnimator()
            animateGreenViewWithAnimator()
            animateOrangeViewWithAnimator()
            animateYellowViewWithAnimator()
        } else {
            configureConstraints()
            let animator = UIViewPropertyAnimator(duration: 0.20, curve: .linear) {
                self.view.layoutIfNeeded()
            }
            animator.startAnimation()
        }
        
        self.animateButton.isSelected = !self.animateButton.isSelected
    }
    
    internal func animateDarkBlueViewWithSnapkit() {
        self.darkBlueView.snp.remakeConstraints {
            (view) in
            view.trailing.equalToSuperview().inset(20)
            view.top.equalToSuperview().offset(20)
            view.size.equalTo(ViewController.squareSize)
        }
        
        //        UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
        //            self.darkBlueView.frame = newFrame
        //            self.darkBlueView.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 25/255, blue: 25/255, alpha: 0.5)
        //        }.startAnimation()
        
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut) {
           // self.darkBlueView.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 25/255, blue: 25/255, alpha: 0.5)
            self.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    internal func animateBlueViewWithAnimator() {
        
        self.darkBlueView.snp.remakeConstraints { (view) in
            view.trailing.equalToSuperview().inset(20.0)
            view.top.equalToSuperview().offset(20.0)
            view.size.equalTo(ViewController.squareSize)
        }
        
        blueAnimator.addAnimations {
            self.view.layoutIfNeeded()
        }
        
        blueAnimator.startAnimation()
    }
    
    internal func animateGreenViewWithSnapkit() {
        self.greenView.snp.remakeConstraints {
            (view) in
            view.trailing.equalToSuperview().inset(20)
            view.top.equalTo(darkBlueView.snp.bottom).offset(20)
            view.size.equalTo(ViewController.squareSize)
        }
        
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut) {
          //  self.greenView.backgroundColor = UIColor(colorLiteralRed: 1/255, green: 25/255, blue: 255/255, alpha: 0.5)
            self.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    internal func animateGreenViewWithAnimator() {
        
        self.greenView.snp.remakeConstraints { (view) in
            view.trailing.equalToSuperview().inset(20.0)
            view.top.equalTo(darkBlueView.snp.bottom).offset(20.0)
            view.size.equalTo(ViewController.squareSize)
        }
        
        greenAnimator.addAnimations {
            self.view.layoutIfNeeded()
        }
        
        greenAnimator.startAnimation()
    }
    
    internal func animateYellowViewWithSnapkit() {
        self.yellowView.snp.remakeConstraints {
            (view) in
            view.trailing.equalToSuperview().inset(20)
            view.top.equalTo(greenView.snp.bottom).offset(20)
            view.size.equalTo(ViewController.squareSize)
        }
        
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear) {
           // self.yellowView.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 100/255, blue: 255/255, alpha: 0.5)
            self.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    internal func animateYellowViewWithAnimator() {
        
        self.yellowView.snp.remakeConstraints { (view) in
            view.trailing.equalToSuperview().inset(20.0)
            view.top.equalTo(greenView.snp.bottom).offset(20.0)
            view.size.equalTo(ViewController.squareSize)
        }
        
        yellowAnimator.addAnimations {
            self.view.layoutIfNeeded()
        }
        
        yellowAnimator.startAnimation()
    }
    
    internal func animateOrangeViewWithSnapkit() {
        self.orangeView.snp.remakeConstraints {
            (view) in
            view.trailing.equalToSuperview().inset(20)
            view.top.equalTo(yellowView.snp.bottom).offset(20)
            view.size.equalTo(ViewController.squareSize)
        }
        
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn) {
           // self.orangeView.backgroundColor = UIColor(colorLiteralRed: 55/255, green: 255/255, blue: 0, alpha: 0.5)
            self.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    internal func animateOrangeViewWithAnimator() {
        
        self.orangeView.snp.remakeConstraints { (view) in
            view.trailing.equalToSuperview().inset(20.0)
            view.top.equalTo(yellowView.snp.bottom).offset(20.0)
            view.size.equalTo(ViewController.squareSize)
        }
        
        orangeAnimator.addAnimations {
            self.view.layoutIfNeeded()
        }
        
        orangeAnimator.startAnimation()
    }
    
    // MARK: Frames
    internal func animateDarkBlueViewWithFrames() {
        let newFrame = self.darkBlueView.frame.offsetBy(dx: 300.0, dy: 600.0)
        UIView.animate(withDuration: 4.5) {
            self.darkBlueView.frame = newFrame
            self.darkBlueView.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 25/255, blue: 25/255, alpha: 0.5)
        }
    }
    
    
    // MARK: - Lazy Inits
    internal lazy var darkBlueView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(colorLiteralRed: 100/255, green: 155/255, blue: 255/255, alpha: 1.0)
        return view
    }()
    
    internal lazy var greenView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(colorLiteralRed: 150/255, green: 255/255, blue: 175/255, alpha: 1.0)
        return view
    }()
    
    internal lazy var yellowView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 225/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    internal lazy var orangeView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 100/255, blue: 25/255, alpha: 1.0)
        return view
    }()
    
    internal lazy var animateButton: UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        button.setTitle("Animate!", for: .normal)
        button.setTitle("Again?", for: .selected)
        return button
    }()
    
}

