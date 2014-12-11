//
//  Slider.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 12/3/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import UIKit

class CustomSlider : UIControl {
    var value : CGFloat = 0.5 {
        didSet{
            //First we check the value to ensure it is within the bounds (0.0 -> 1.0)
            (value < 0.0) ? (value = 0.0) : (value = value)
            (value > 1.0) ? (value = 1.0) : (value = value)
            
            //Then update each layer to reflect the value
            updateLayers()
        }
    }
    let leftBarLayer = CAShapeLayer()
    let rightBarLayer = CAShapeLayer()
    let handleLayer = Handle()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Add layers
        self.layer.addSublayer(leftBarLayer)
        self.layer.addSublayer(rightBarLayer)
        self.layer.addSublayer(handleLayer)
        
        self.layoutLayerFrames()
    }
    
    func layoutLayerFrames(){
        leftBarLayer.frame = self.bounds
        rightBarLayer.frame = self.bounds
        updateLayers()
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
        return CGRectContainsPoint(handleLayer.frame, touch.locationInView(self))
    }
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
        var point = touch.locationInView(self) //Location of touch
        
        //We only care about the horizontal component
        value = point.x / self.frame.width
        return true
    }
    
    func updateLayers(){
        //Disables the animation of any layer changes
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        
        let leftBarLayerPath = CGPathCreateMutable()
        CGPathMoveToPoint(leftBarLayerPath, nil, 0, self.frame.height/2)
        CGPathAddLineToPoint(leftBarLayerPath, nil, self.frame.width * value, self.frame.height/2)
        leftBarLayer.path = leftBarLayerPath
        leftBarLayer.strokeColor = self.tintColor.CGColor
        leftBarLayer.lineWidth = 4
        leftBarLayer.lineCap = kCALineCapRound
        
        let rightBarLayerPath = CGPathCreateMutable()
        CGPathMoveToPoint(rightBarLayerPath, nil, self.frame.width * value, self.frame.height/2)
        CGPathAddLineToPoint(rightBarLayerPath, nil, self.frame.width, self.frame.height/2)
        rightBarLayer.path = rightBarLayerPath
        rightBarLayer.strokeColor = self.tintColor.colorWithAlphaComponent(0.15).CGColor
        rightBarLayer.lineWidth = 4
        rightBarLayer.lineCap = kCALineCapRound
        
        handleLayer.position = CGPointMake(self.frame.width * value, self.frame.size.height/2)
        handleLayer.strokeColor = UIColor.whiteColor().CGColor
        handleLayer.fillColor = self.tintColor.CGColor
        CATransaction.commit()
    }
    
    override func tintColorDidChange() {
        updateLayers()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
