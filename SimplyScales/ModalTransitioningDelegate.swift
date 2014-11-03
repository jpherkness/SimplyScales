//
//  ModalTransitioningDelegate.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 10/22/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import Foundation
import UIKit

class ModalTransitioningDelegate : NSObject, UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController!,
        presentingViewController presenting: UIViewController!,
        sourceViewController source: UIViewController!) -> UIPresentationController! {
            
            return ModalPresentationController(presentedViewController: presented,
                presentingViewController: presenting)
    }
}
