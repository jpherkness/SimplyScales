//
//  ColorSelectionViewController.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 11/25/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import UIKit

class colorSelectionViewController : UIViewController {
    override init() {
        super.init()
        
        self.view.frame = CGRectMake(20, self.view.frame.height/2 - 190, self.view.frame.width - 40, 380)
        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius = 10
        self.view.backgroundColor = UIColor.whiteColor()
        
        var colorsPerRow = 4
        var spacing : CGFloat = 20
        var size = (self.view.frame.size.width - CGFloat(colorsPerRow + 1) * spacing)/CGFloat(colorsPerRow)
        
        var scrollView = UIScrollView(frame : CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        scrollView.contentSize = CGSizeMake(self.view.frame.width, CGFloat(UIColor.flatColors().count/colorsPerRow) * (size + spacing) + spacing)
        scrollView.bounces = false
        self.view.addSubview(scrollView)
        
        var x : CGFloat = spacing
        var y : CGFloat = spacing
        for color in UIColor.flatColors() as [UIColor]{
            var colorButton = UIButton(frame: CGRectMake(x, y , size, size))
            colorButton.backgroundColor = color
            colorButton.addTarget(self, action: "colorSelected:", forControlEvents: UIControlEvents.TouchUpInside)
            colorButton.layer.cornerRadius = 6
            colorButton.layer.masksToBounds = true
            scrollView.addSubview(colorButton)
            
            x += size + spacing
            if(x + size > self.view.frame.size.width){
                x = spacing
                y += size + spacing
            }
        }
    }
    func colorSelected(sender : UIButton){
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nil, bundle: nil)
    }
}