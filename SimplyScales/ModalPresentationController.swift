//
//  CustomPresentationController.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 10/22/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import Foundation
import UIKit

class ModalPresentationController : UIPresentationController {
    let dimmingView = UIView()
    
    override init(presentedViewController: UIViewController!, presentingViewController: UIViewController!) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
    }
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView.bounds
        dimmingView.alpha = 0.0
        containerView.insertSubview(dimmingView, atIndex: 0)
        
        presentedViewController.transitionCoordinator()!.animateAlongsideTransition({
            context in
            self.dimmingView.alpha = 1.0
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator()!.animateAlongsideTransition({
            context in
            self.dimmingView.alpha = 0.0
            }, completion: {
                context in
                self.dimmingView.removeFromSuperview()
        })
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        return presentedViewController.view.frame
    }
    
    override func containerViewWillLayoutSubviews() {
        dimmingView.frame = containerView.bounds
        presentedView().frame = frameOfPresentedViewInContainerView()
    }
}
