//
//  JumblerViewController.swift
//  Jumbler
//
//  Created by ChristianBieniak on 13/3/19.
//  Copyright © 2019 BienThere. All rights reserved.
//

import UIKit

struct Selection {
    var text: String
}

class JumblerViewController: UIViewController {
    
    var items: [Selection] = (1...50).map { Selection(text: String($0)) }
    
    var buttons: [UIView] = []
    
    var spacing: CGFloat = 8
    
    var potentionalColors: [UIColor] = [#colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.4431372549, alpha: 1),#colorLiteral(red: 0.9058823529, green: 0.2980392157, blue: 0.2352941176, alpha: 1),#colorLiteral(red: 0.2039215686, green: 0.5960784314, blue: 0.8588235294, alpha: 1),#colorLiteral(red: 0.6078431373, green: 0.3490196078, blue: 0.7137254902, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = items.map {
            let button = ColouredButton(frame: .zero)
            potentionalColors.shuffle()
            button.colorStruct = ColouredButton.ColorStruct(top: potentionalColors[0],
                                                            bottom: potentionalColors[1],
                                                            left: potentionalColors[2],
                                                            right: potentionalColors[3],
                                                            text: potentionalColors.randomElement() ?? .black)
            button.setTitle($0.text, for: .normal)
            button.addTarget(self, action: #selector(jumble), for: .touchUpInside)
            view.addSubview(button)
            return button
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        reload()
    }
    
    func reload() {
        buttons.enumerated().forEach { (offset, button) in
            button.frame = position(index: offset, frame: view.frame)
        }
    }
    
    func position(index: Int, frame: CGRect) -> CGRect {
        let rowPosition = CGFloat(index % 5)
        let columnPosition = CGFloat(index / 5)
        let remainingFrame = CGSize(width: frame.width - spacing * 6, height: frame.height - spacing * 11)
        let itemSize = CGSize(width: remainingFrame.width / 5, height: remainingFrame.height / 10)
        let xPos = rowPosition * itemSize.width + (rowPosition + 1) * spacing
        let yPos = columnPosition * itemSize.height + (columnPosition + 1) * spacing
        let position = CGPoint(x: xPos, y: yPos)
        return CGRect(origin: position, size: itemSize)
    }

    @objc func jumble(sender: UIView) {
        buttons.shuffle()
        reload()
    }

}
