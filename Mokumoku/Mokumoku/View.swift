//
//  View.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/16.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class View: UIView {
    
    let subView: UIView = .init()
    let grandSubView: UIView = .init()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
//        self.addSubview(self.subView)
        self.subView.addSubview(self.grandSubView)
        self.backgroundColor = UIColor.blue
        self.subView.backgroundColor = UIColor.red
        self.grandSubView.backgroundColor = UIColor.green
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.subView.frame = self.centeredFrame(inside: self.bounds)
        self.grandSubView.frame = self.centeredFrame(inside: self.subView.bounds)
    }
}

extension View {
    func centeredFrame (inside bounds: CGRect) -> CGRect {
        var frame = bounds
        frame.origin.x += 10
        frame.origin.y += 10
        frame.size.width -= 20
        frame.size.height -= 20
        return frame
    }
}
