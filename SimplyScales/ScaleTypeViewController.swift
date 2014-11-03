//
//  ScaleTypeViewController.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 10/22/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import Foundation
import UIKit
//MARK: - ScaleTypeViewController
class ScaleTypeViewController : UIViewController {
    override init() {
        super.init()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: - ScaleTypeTableView
class ScaleTypeTableView : UIView, UITableViewDataSource, UITableViewDelegate{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Blur
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark)) as UIVisualEffectView
        visualEffectView.frame = self.bounds
        self.addSubview(visualEffectView)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - UITableViewDatasource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int()
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    //MARK: - UITableViewDelegate
    
}

