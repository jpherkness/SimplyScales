//
//  ViewController.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 10/18/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, RadialScaleControlDelegate, RadialScaleControlDatasource, UIPopoverPresentationControllerDelegate {
    let modalTransitioningDelegate = ModalTransitioningDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create the radial scal control
        var rsc = RadialScaleControl(frame: CGRectMake(self.view.center.x - 150, self.view.center.y - 150, 300, 300))
        rsc.tintColor = FlatSkyBlue
        //add views to the controller 
        self.view.addSubview(rsc);
        
        var slider = Slider(frame: CGRectMake(0, 60, self.view.frame.width, 50))
        slider.tintColor = FlatSkyBlue
        self.view.addSubview(slider)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var modalViewController = settingsViewController()
        modalViewController.transitioningDelegate = modalTransitioningDelegate
        modalViewController.modalPresentationStyle = .Custom
        presentViewController(modalViewController, animated: true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

