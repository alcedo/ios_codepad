//
//  ViewController.swift
//  codepath_wk1a1
//
//  Created by Victor Liew on 5/2/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rotten Tomatoes"
        self.view.backgroundColor = UIColor.whiteColor()
        
        RTmodel().getBoxOffice({ (data) -> Void in
            let jsonData = data as? NSDictionary
            let title = jsonData!["movies"]![0]["title"] as String
            let synopsis = jsonData!["movies"]![0]["synopsis"] as String
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

