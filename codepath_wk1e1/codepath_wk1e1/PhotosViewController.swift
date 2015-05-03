//
//  ViewController.swift
//  codepath_wk1e1
//
//  Created by Victor Liew on 5/2/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import UIKit
import Snap

class PhotosViewController: UIViewController {

    let instagram = InstagramModel()
    var mediaArray: Array<AnyObject>?
    
    override func loadView() {
        // re-assign self.view due to manual overrides.
        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setupViewStructure()
        self.setupConstrain()
    }
    
    // MARK: - UI View Creations Goes Here
    func setupViewStructure() {
        
    }
    
    // MARK: - Constraints
    func setupConstrain() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instagram.getPopular({ data in
            mediaArray = data
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

