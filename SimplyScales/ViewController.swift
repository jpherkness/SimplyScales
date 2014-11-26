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
        //Creates a radial scale control and adds it to the view
        let radialScaleControl = RadialScaleControl(frame: CGRectMake(self.view.frame.size.width / 2 - 135, self.view.frame.size.height / 2 - 135, 270, 270))
        self.view.addSubview(radialScaleControl)
        radialScaleControl.tintColor = RandomFlatColor
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var modalViewController = colorSelectionViewController()
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

