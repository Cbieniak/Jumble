//
//  TimerManager.swift
//  Jumbler
//
//  Created by ChristianBieniak on 16/3/19.
//  Copyright © 2019 BienThere. All rights reserved.
//

import Foundation


class TimerManager {
    
    typealias ChangeHandler = (TimeInterval) -> Void
    
    public var isCurrentlyRunning: Bool {
        return self.timer != nil
    }
    
    private var timer: Timer?
    
    private var timeInterval: TimeInterval
    
    private var timeDidChange: ChangeHandler
    
    private var time: TimeInterval?
    
    init(timeInterval: TimeInterval = 0.1,
         timeDidChange: @escaping ChangeHandler) {
        self.timeInterval = timeInterval
        self.timeDidChange = timeDidChange
        time = 0
    }
    
    
    func start(fresh: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { (timer) in
            guard let time = self.time else { return }
            self.time = time + self.timeInterval
            self.timeDidChange(self.time!)
        })
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func clear() {
        time = 0
    }
}
