//
//  HostViewController.swift
//  Jumbler
//
//  Created by ChristianBieniak on 16/3/19.
//  Copyright © 2019 BienThere. All rights reserved.
//

import UIKit

class HostViewController: UIViewController {

    var timerViewController: TimerViewController!
    
    var jumblerViewController: JumblerViewController!
    
    let jumblerScreenPortion: CGFloat = 0.85
    
    private var jumblerView: UIView {
        return jumblerViewController.view
    }
    
    private var timerView: UIView {
        return timerViewController.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTimerViewController()
        setupJumblerViewController()
        
        setupTimerViewConstraints(portionOfScreen: 1 - jumblerScreenPortion)
        setupJumblerViewConstraints(portionOfScreen: jumblerScreenPortion)
    }
    
    func setupJumblerViewController() {
        jumblerViewController = JumblerViewController()
        addChildViewController(childVC: jumblerViewController)
    }
    
    func setupTimerViewController() {
        timerViewController = TimerViewController()
        addChildViewController(childVC: timerViewController)
    }
    
    func setupJumblerViewConstraints(portionOfScreen: CGFloat) {
        contrainToSafeAreaHorizontally(childView: jumblerView)
        jumblerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        jumblerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: portionOfScreen).isActive = true
    }
    
    func setupTimerViewConstraints(portionOfScreen: CGFloat) {
        contrainToSafeAreaHorizontally(childView: timerView)
        timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        timerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: portionOfScreen).isActive = true
    }
    
    func contrainToSafeAreaHorizontally(childView: UIView) {
        childView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        childView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    
}
