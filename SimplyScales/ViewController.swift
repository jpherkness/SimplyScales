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
        
        //add the radial scale control
        var rsc = RadialScaleControl(frame: CGRectMake(self.view.frame.width / 10, self.view.frame.height - 9 * self.view.frame.width / 10, 8 * self.view.frame.width / 10, 8 * self.view.frame.width / 10))
        self.view .addSubview(rsc)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //var modalViewController = settingsViewController()
        //modalViewController.transitioningDelegate = modalTransitioningDelegate
        //modalViewController.modalPresentationStyle = .Custom
        //presentViewController(modalViewController, animated: true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

