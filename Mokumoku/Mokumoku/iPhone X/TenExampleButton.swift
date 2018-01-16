//
//  TenExampleButton.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/30.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import Foundation
import UIKit

class TenExampleButton: UIButton{
    
    var isMoving: Bool = false
    var position: CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        position = self.frame.origin
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        isMoving = true
        
        guard let touchFirst = touches.first else { return }
        
        let preX = touchFirst.previousLocation(in: superview).x
        let preY = touchFirst.previousLocation(in: superview).y
        
        let newX = touchFirst.location(in: superview).x
        let newY = touchFirst.location(in: superview).y
        
        let dx = newX - preX
        let dy = newY - preY
        
        var viewFrame = self.frame
        viewFrame.origin.x += dx
        viewFrame.origin.y += dy
        
        self.frame = viewFrame
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isMoving = false
        if position == self.frame.origin{
            self.sendActions(for: .touchUpInside)
        }
    }
}
