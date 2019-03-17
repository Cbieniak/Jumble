//
//  ColouredButton.swift
//  Jumbler
//
//  Created by ChristianBieniak on 17/3/19.
//  Copyright © 2019 BienThere. All rights reserved.
//

import UIKit

class ColouredButton: UIButton {
    
    struct ColorStruct {
        var top: UIColor
        var bottom: UIColor
        var left: UIColor
        var right: UIColor
        var text: UIColor
    }
    
    var colorStruct: ColorStruct!
    
    var lineWidth: CGFloat = 2.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var topPath = self.bounds
        topPath.size.height = lineWidth
        let topLayer = layer(with: topPath, lineWidth: lineWidth, color: colorStruct.top)
        
        var bottomPath = self.bounds
        bottomPath.origin.y = bottomPath.height - lineWidth
        bottomPath.size.height = lineWidth
        let bottomLayer = layer(with: bottomPath, lineWidth: lineWidth, color: colorStruct.bottom)
        
        var leftPath = self.bounds
        leftPath.size.width = lineWidth
        let leftLayer = layer(with: leftPath, lineWidth: lineWidth, color: colorStruct.left)
        
        var rightPath = self.bounds
        rightPath.origin.x = rightPath.size.width - lineWidth
        rightPath.size.width = lineWidth
        let rightLayer = layer(with: rightPath, lineWidth: lineWidth, color: colorStruct.right)
        
        self.layer.addSublayer(topLayer)
        self.layer.addSublayer(bottomLayer)
        self.layer.addSublayer(leftLayer)
        self.layer.addSublayer(rightLayer)
        
        self.setTitleColor(colorStruct.text, for: .normal)
    }
    
    func layer(with rect: CGRect, lineWidth: CGFloat, color: UIColor) -> CALayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = lineWidth
        shapeLayer.path = UIBezierPath(rect: rect).cgPath
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineCap = .round
        
        return shapeLayer
    }
}
