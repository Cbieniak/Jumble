//
//  BlockButton.swift
//  Jumbler
//
//  Created by ChristianBieniak on 17/3/19.
//  Copyright © 2019 BienThere. All rights reserved.
//

import UIKit

class BlockButton: UIButton {
    
    var onTouchUpInside: ((BlockButton) -> Void)? {
        didSet {
            addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        }
    }
    
    @objc func touchUpInside() {
        onTouchUpInside?(self)
    }
    
}
