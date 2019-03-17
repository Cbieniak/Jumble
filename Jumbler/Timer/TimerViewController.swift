//
//  TimerViewController.swift
//  Jumbler
//
//  Created by ChristianBieniak on 16/3/19.
//  Copyright © 2019 BienThere. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    private var clearButton: BlockButton!
    
    private var timerControlButton: BlockButton!
    
    private var timerLabel: UILabel!
    
    private let labelPortion: CGFloat = 0.6
    
    private lazy var timerManager: TimerManager = setupTimerManager()
    
    private lazy var dateFormatter: DateComponentsFormatter = setupFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupClearButton()
        setupTimerControlButton()
        setupTimerLabel()
        

        layoutClearButton(widthPortion: (1 - labelPortion) * 0.5)
        layoutTimerControlButton(widthPortion: (1 - labelPortion) * 0.5)
        layoutTimerLabel(widthPortion: labelPortion)
        
        
    }
    
    func setupClearButton() {
        clearButton = view.addSubviewOfType(subviewType: BlockButton.self)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.onTouchUpInside = { [weak self] _ in
            self?.timerManager.clear()
            self?.timerLabel.text = self?.timeString(from: 0)
        }
    }
    
    
    func setupTimerControlButton() {
        timerControlButton = view.addSubviewOfType(subviewType: BlockButton.self)
        timerControlButton.setTitle("Start", for: .normal)
        timerControlButton.setTitleColor(.black, for: .normal)
        timerControlButton.onTouchUpInside = { [weak self] _ in
            guard let self = self else { return }
            if self.timerManager.isCurrentlyRunning {
                self.timerManager.stop()
                self.timerControlButton.setTitle("Start", for: .normal)
            } else {
                self.timerManager.start(fresh: false)
                self.timerControlButton.setTitle("Stop", for: .normal)
            }
            
        }
    }
    
    func setupTimerLabel() {
        timerLabel = view.addSubviewOfType(subviewType: UILabel.self)
        timerLabel.text = timeString(from: 0)
        timerLabel.textColor = .black
        timerLabel.textAlignment = .center
    }
    
    func setupTimerManager() -> TimerManager {
        let timerManager = TimerManager(timeDidChange: { [weak self] value in
            self?.timerLabel.text = self?.timeString(from: value)
        })
        
        return timerManager
    }
    
    func setupFormatter() -> DateComponentsFormatter {
        let dateFormatter = DateComponentsFormatter()
        dateFormatter.zeroFormattingBehavior = .pad
        dateFormatter.allowedUnits = [.minute, .second]
        dateFormatter.unitsStyle = .positional
        
        return dateFormatter
    }
    
    func layoutClearButton(widthPortion: CGFloat) {
        clearButton.constrainToViews(top: view.topAnchor,
                                     bottom: view.bottomAnchor,
                                     leading: view.leadingAnchor,
                                     trailing: timerLabel.leadingAnchor)
        
        clearButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthPortion).isActive = true
        
    }
    
    func layoutTimerControlButton(widthPortion: CGFloat) {
        timerControlButton.constrainToViews(top: view.topAnchor,
                                     bottom: view.bottomAnchor,
                                     leading: timerLabel.trailingAnchor,
                                     trailing: view.trailingAnchor)
        
        timerControlButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthPortion).isActive = true
        
    }
    
    func layoutTimerLabel(widthPortion: CGFloat) {
        timerLabel.constrainToViews(top: view.topAnchor,
                                    bottom: view.bottomAnchor,
                                    leading: clearButton.trailingAnchor,
                                    trailing: timerControlButton.leadingAnchor)
        
        timerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthPortion).isActive = true
        
    }
    
    func timeString(from interval: TimeInterval) -> String? {
        return dateFormatter.string(from: interval)
    }
    
}
