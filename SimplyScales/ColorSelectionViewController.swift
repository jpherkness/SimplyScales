//
//  ColorSelectionViewController.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 11/25/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import UIKit

class settingsViewController : UIViewController {
    override init() {
        super.init()
    }
    
    override func viewDidLoad() {
        //Set the frame of the view
        self.view.frame = CGRectMake(30, self.view.frame.height/2 - 200, self.view.frame.size.width - 60, 400)
        
        //Set the background views appearance
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius = 3
        
        //Create a navigationBar and add it to the view
        var navBar : UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.width, 45))
        navBar.barTintColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        navBar.translucent = false
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)]
        navBar.tintColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        navBar.clipsToBounds = true
        
        //Add a new navigation item with a title to the new nav bar
        var title = UINavigationItem()
        title.title = "Settings"
        navBar.setItems([title], animated: false)
        
        //Add a cancel button
        var dismiss = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: nil, action: nil)
        self.view.addSubview(navBar)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}