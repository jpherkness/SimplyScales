//
//  handle.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 12/5/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import Foundation
import UIKit

class Handle : CAShapeLayer {
    let size : CGFloat = 25
    
    override init(){
        super.init()
        
        self.bounds = CGRectMake(0, 0, size + 20, size + 20) //This is going to represent the clickable area
        self.anchorPoint = CGPointMake(0.5, 0.5) //Center the anchor point
        let handlePath = CGPathCreateMutable()
        CGPathAddEllipseInRect(handlePath, nil, CGRectMake(self.bounds.size.width/2 - size/2, self.bounds.size.height/2 - size/2, size, size))
        self.path = handlePath
        self.lineCap = kCALineCapRound
        self.lineWidth = 2
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init!(layer: AnyObject!) {
        super.init(layer: layer)
    }
}